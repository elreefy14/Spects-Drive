import 'package:bedrive/drive/database.dart';
import 'package:drift/drift.dart';
import 'package:http/http.dart';
import 'package:uuid/uuid.dart';

part '../../.generated/drive/offline/api_response_cache.g.dart';

class ApiResponseCacheTable extends Table {
  @override
  Set<Column> get primaryKey => {key};

  TextColumn get key => text()();

  TextColumn get url => text()();

  BlobColumn get body => blob()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();
}

class ApiResponseCacheKey {
  static const _uuid = Uuid();
  final String key;

  ApiResponseCacheKey(String url) : key = _uuid.v5(Uuid.NAMESPACE_URL, url);
}

@DriftAccessor(tables: [ApiResponseCacheTable])
class ApiResponseCacheDao extends DatabaseAccessor<AppDatabase>
    with _$ApiResponseCacheDaoMixin {
  ApiResponseCacheDao(super.db);

  Future<ApiResponseCacheTableData?> get(Uri uri) async {
    final key = ApiResponseCacheKey(uri.toString()).key;
    final query = select(apiResponseCacheTable)
      ..where((t) => t.key.equals(key))
      ..limit(1);
    final result = await query.getSingleOrNull();
    if (result == null) return Future.value();

    return result;
  }

  Future<void> set(Response response) async {
    final url = response.request!.url.toString();
    final key = ApiResponseCacheKey(url).key;
    await into(apiResponseCacheTable).insert(
      ApiResponseCacheTableCompanion(
        key: Value(key),
        url: Value(url),
        body: Value(response.bodyBytes),
        createdAt: Value(DateTime.now().toUtc()),
        updatedAt: Value(DateTime.now().toUtc()),
      ),
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<void> deleteKey(String key, {bool staleOnly = false}) async {
    final query = this.delete(apiResponseCacheTable)
      ..where((t) => t.key.equals(key));
    await query.go();
  }

  Future<void> clean() async {
    final query = this.delete(apiResponseCacheTable)
      ..where(
        (t) => t.updatedAt.isSmallerOrEqualValue(
          DateTime.now().subtract(const Duration(days: 7)).toUtc(),
        ),
      );
    await query.go();
  }
}
