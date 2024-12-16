import 'dart:convert';
import 'dart:io';

import 'package:bedrive/drive/database.dart';
import 'package:bedrive/drive/offline/api_response_cache.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../auth/access_token_store.dart';
import '../bootstrap/local_config_provider.dart';
import 'api_client_exception.dart';

part '../.generated/http/api_client.g.dart';

typedef ApiHttpClientErrorHandler = void Function(ApiClientException e);

enum HttpMethod {
  get,
  post,
  put,
  delete,
}

class ApiClientOptions {
  final bool cacheResponse;

  ApiClientOptions({this.cacheResponse = false});
}

class ApiHttpClient {
  final String baseUrl;
  final ApiResponseCacheDao apiCache;
  final List<ApiHttpClientErrorHandler> _errorHandlers = [];

  ApiHttpClient({required this.baseUrl, required this.apiCache});

  Map<String, String> get authHeaders {
    final token = AccessTokenStore.instance.get();
    if (token != null) {
      return {'Authorization': 'Bearer $token'};
    }
    return {};
  }

  Future<T> get<T>(
    String path, {
    Map<String, String>? queryParams,
    Map<String, String>? headers,
    ApiClientOptions? options,
  }) async {
    return _makeRequest<T>(
      path: path,
      method: HttpMethod.get,
      params: queryParams,
      headers: headers,
      options: options,
    );
  }

  Future<T> post<T>(
    String path,
    Map<String, dynamic> body,
  ) async {
    return _makeRequest<T>(
      path: path,
      method: HttpMethod.post,
      body: body,
    );
  }

  Future<T> put<T>(
    String path,
    Map<String, dynamic> body,
  ) async {
    return _makeRequest<T>(
      path: path,
      method: HttpMethod.put,
      body: body,
    );
  }

  Future<T> delete<T>(String path, [Map<String, String>? params]) async {
    return _makeRequest<T>(
      path: path,
      method: HttpMethod.delete,
      params: params,
    );
  }

  _makeRequest<T>({
    required String path,
    required HttpMethod method,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    ApiClientOptions? options,
  }) async {
    options = options ?? ApiClientOptions();

    Uri uri = buildUri(path);
    headers = {
      'Content-Type': headers?['Content-Type'] ?? 'application/json',
      'Accept': headers?['Accept'] ?? 'application/json',
      ...authHeaders,
    };
    if (method == HttpMethod.put) {
      headers['X-HTTP-Method-Override'] = 'PUT';
    } else if (method == HttpMethod.delete) {
      headers['X-HTTP-Method-Override'] = 'DELETE';
    }

    if (params != null) {
      uri = uri.replace(queryParameters: params);
    }

    try {
      final encodedBody = body != null ? jsonEncode(body) : null;

      final response = switch (method) {
        HttpMethod.get => await _getWithCacheFallback(uri, headers: headers),
        HttpMethod.post =>
          await http.post(uri, headers: headers, body: encodedBody),
        HttpMethod.put =>
          await http.put(uri, headers: headers, body: encodedBody),
        HttpMethod.delete => await http.delete(uri, headers: headers),
      };

      switch (response.statusCode) {
        case >= 200 && < 400:
          _maybeCacheResponse(response, options);
          return headers['Accept'] == 'application/json'
              ? jsonDecode(response.body) as T
              : response.body as T;
        default:
          throw (ApiClientException.fromResponseBody(
            response.body,
            response.statusCode,
          ));
      }
    } on Exception catch (e) {
      if (e is ApiClientException) {
        rethrow;
      } else {
        throw ApiClientException.fromException(e);
      }
    }
  }

  Uri buildUri(String path) {
    if (path.startsWith('http')) {
      return Uri.parse(path);
    }

    final prefixedPath = !path.contains('api/v1') ? 'api/v1/$path' : path;
    final [protocol, baseUrlWithoutProtocol] = baseUrl.split('://');
    if (protocol == 'https') {
      return Uri.https(baseUrlWithoutProtocol, prefixedPath);
    }
    return Uri.http(baseUrlWithoutProtocol, prefixedPath);
  }

  bool Function() onError(ApiHttpClientErrorHandler errorHandler) {
    _errorHandlers.add(errorHandler);
    return () => _errorHandlers.remove(errorHandler);
  }

  Future<http.Response> _getWithCacheFallback(
    Uri uri, {
    Map<String, String>? headers,
  }) async {
    try {
      return await http.get(uri, headers: headers);
    } on SocketException catch (_) {
      final cachedResponse = await apiCache.get(uri);
      if (cachedResponse != null) {
        return http.Response.bytes(
          cachedResponse.body,
          304,
        );
      }
      rethrow;
    }
  }

  void _maybeCacheResponse(http.Response response, ApiClientOptions options) {
    if (!options.cacheResponse ||
        response.request == null ||
        response.request!.method != 'GET' ||
        response.statusCode == 304) {
      return;
    }

    apiCache.set(response);
  }
}

@Riverpod(keepAlive: true)
Future<ApiHttpClient> apiClient(ApiClientRef ref) async {
  final localConfig = ref.watch(localConfigProvider).requireValue;
  final db = ref.watch(appDatabaseProvider);
  final apiCache = ApiResponseCacheDao(db);
  return ApiHttpClient(baseUrl: localConfig.backendUrl, apiCache: apiCache);
}
