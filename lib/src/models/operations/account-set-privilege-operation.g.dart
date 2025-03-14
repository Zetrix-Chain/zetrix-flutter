// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account-set-privilege-operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountSetPrivilegeOperation _$AccountSetPrivilegeOperationFromJson(
        Map<String, dynamic> json) =>
    AccountSetPrivilegeOperation(
      masterWeight: (json['key'] as num?)?.toInt(),
      signers: (json['signers'] as List<dynamic>?)
          ?.map((e) => Signer.fromJson(e as Map<String, dynamic>))
          .toList(),
      txThreshold: (json['tx_threshold'] as num?)?.toInt(),
      typeThresholds: (json['type_thresholds'] as List<dynamic>?)
          ?.map((e) => TypeThreshold.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..operationType =
          $enumDecodeNullable(_$OperationTypeEnumMap, json['operationType'])
      ..sourceAddress = json['sourceAddress'] as String?
      ..metadata = json['metadata'] as String?;

Map<String, dynamic> _$AccountSetPrivilegeOperationToJson(
        AccountSetPrivilegeOperation instance) =>
    <String, dynamic>{
      'operationType': _$OperationTypeEnumMap[instance.operationType],
      'sourceAddress': instance.sourceAddress,
      'metadata': instance.metadata,
      'key': instance.masterWeight,
      'signers': instance.signers,
      'tx_threshold': instance.txThreshold,
      'type_thresholds': instance.typeThresholds,
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
