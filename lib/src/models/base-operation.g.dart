// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base-operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseOperation _$BaseOperationFromJson(Map<String, dynamic> json) =>
    BaseOperation(
      operationType:
          $enumDecodeNullable(_$OperationTypeEnumMap, json['operationType']),
      sourceAddress: json['sourceAddress'] as String?,
      operations: json['operations'] as String?,
    );

Map<String, dynamic> _$BaseOperationToJson(BaseOperation instance) =>
    <String, dynamic>{
      'operationType': _$OperationTypeEnumMap[instance.operationType],
      'sourceAddress': instance.sourceAddress,
      'operations': instance.operations,
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
