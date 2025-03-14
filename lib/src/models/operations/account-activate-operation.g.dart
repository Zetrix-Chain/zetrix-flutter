// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account-activate-operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountActivateOperation _$AccountActivateOperationFromJson(
        Map<String, dynamic> json) =>
    AccountActivateOperation(
      destAddress: json['dest_address'] as String?,
      initBalance: json['init_balance'] as String?,
      priv: json['priv'] == null
          ? null
          : Priv.fromJson(json['priv'] as Map<String, dynamic>),
    )
      ..operationType =
          $enumDecodeNullable(_$OperationTypeEnumMap, json['operationType'])
      ..sourceAddress = json['sourceAddress'] as String?
      ..metadata = json['metadata'] as String?;

Map<String, dynamic> _$AccountActivateOperationToJson(
        AccountActivateOperation instance) =>
    <String, dynamic>{
      'operationType': _$OperationTypeEnumMap[instance.operationType],
      'sourceAddress': instance.sourceAddress,
      'metadata': instance.metadata,
      'dest_address': instance.destAddress,
      'init_balance': instance.initBalance,
      'priv': instance.priv,
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
