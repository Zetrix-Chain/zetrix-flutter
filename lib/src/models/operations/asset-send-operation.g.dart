// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset-send-operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetSendOperation _$AssetSendOperationFromJson(Map<String, dynamic> json) =>
    AssetSendOperation(
      destAddress: json['dest_address'] as String?,
      code: json['code'] as String?,
      issuer: json['issuer'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
    )
      ..operationType =
          $enumDecodeNullable(_$OperationTypeEnumMap, json['operationType'])
      ..sourceAddress = json['sourceAddress'] as String?
      ..metadata = json['metadata'] as String?;

Map<String, dynamic> _$AssetSendOperationToJson(AssetSendOperation instance) =>
    <String, dynamic>{
      'operationType': _$OperationTypeEnumMap[instance.operationType],
      'sourceAddress': instance.sourceAddress,
      'metadata': instance.metadata,
      'dest_address': instance.destAddress,
      'code': instance.code,
      'issuer': instance.issuer,
      'amount': instance.amount,
    };

const _$OperationTypeEnumMap = {
  OperationType.UNKNOWN: 'UNKNOWN',
  OperationType.ACCOUNT_ACTIVATE: 'ACCOUNT_ACTIVATE',
  OperationType.ACCOUNT_SET_METADATA: 'ACCOUNT_SET_METADATA',
  OperationType.ACCOUNT_SET_PRIVILEGE: 'ACCOUNT_SET_PRIVILEGE',
  OperationType.ASSET_ISSUE: 'ASSET_ISSUE',
  OperationType.ASSET_SEND: 'ASSET_SEND',
  OperationType.GAS_SEND: 'GAS_SEND',
  OperationType.TOKEN_ISSUE: 'TOKEN_ISSUE',
  OperationType.TOKEN_TRANSFER: 'TOKEN_TRANSFER',
  OperationType.TOKEN_TRANSFER_FROM: 'TOKEN_TRANSFER_FROM',
  OperationType.TOKEN_APPROVE: 'TOKEN_APPROVE',
  OperationType.TOKEN_ASSIGN: 'TOKEN_ASSIGN',
  OperationType.TOKEN_CHANGE_OWNER: 'TOKEN_CHANGE_OWNER',
  OperationType.CONTRACT_CREATE: 'CONTRACT_CREATE',
  OperationType.CONTRACT_INVOKE_BY_ASSET: 'CONTRACT_INVOKE_BY_ASSET',
  OperationType.CONTRACT_INVOKE_BY_GAS: 'CONTRACT_INVOKE_BY_GAS',
  OperationType.LOG_CREATE: 'LOG_CREATE',
};
