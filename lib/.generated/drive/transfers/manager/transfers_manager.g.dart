// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../drive/transfers/manager/transfers_manager.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransferManagerMetadataImpl _$$TransferManagerMetadataImplFromJson(
        Map<String, dynamic> json) =>
    _$TransferManagerMetadataImpl(
      transferType: $enumDecode(_$TransferTypeEnumMap, json['transferType']),
      fileSize: json['fileSize'] as int,
      mime: json['mime'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$TransferManagerMetadataImplToJson(
        _$TransferManagerMetadataImpl instance) =>
    <String, dynamic>{
      'transferType': _$TransferTypeEnumMap[instance.transferType]!,
      'fileSize': instance.fileSize,
      'mime': instance.mime,
      'type': instance.type,
    };

const _$TransferTypeEnumMap = {
  TransferType.upload: 'upload',
  TransferType.download: 'download',
  TransferType.offline: 'offline',
};
