// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Operation<T> _$OperationFromJson<T extends JsonSerializable>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    Operation<T>(
      type: (json['type'] as num?)?.toInt(),
      createAccount:
          _$nullableGenericFromJson(json['create_account'], fromJsonT),
      issueAsset: _$nullableGenericFromJson(json['issue_asset'], fromJsonT),
      log: _$nullableGenericFromJson(json['log'], fromJsonT),
      payAsset: _$nullableGenericFromJson(json['pay_asset'], fromJsonT),
      payCoin: _$nullableGenericFromJson(json['pay_coin'], fromJsonT),
      setMetadata: _$nullableGenericFromJson(json['set_metadata'], fromJsonT),
      setPrivilege: _$nullableGenericFromJson(json['set_privilege'], fromJsonT),
      setSignerWeight:
          _$nullableGenericFromJson(json['set_signer_weight'], fromJsonT),
      setThreshold: _$nullableGenericFromJson(json['set_threshold'], fromJsonT),
    );

Map<String, dynamic> _$OperationToJson<T extends JsonSerializable>(
  Operation<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'type': instance.type,
      'create_account':
          _$nullableGenericToJson(instance.createAccount, toJsonT),
      'issue_asset': _$nullableGenericToJson(instance.issueAsset, toJsonT),
      'pay_asset': _$nullableGenericToJson(instance.payAsset, toJsonT),
      'set_metadata': _$nullableGenericToJson(instance.setMetadata, toJsonT),
      'set_signer_weight':
          _$nullableGenericToJson(instance.setSignerWeight, toJsonT),
      'set_threshold': _$nullableGenericToJson(instance.setThreshold, toJsonT),
      'pay_coin': _$nullableGenericToJson(instance.payCoin, toJsonT),
      'log': _$nullableGenericToJson(instance.log, toJsonT),
      'set_privilege': _$nullableGenericToJson(instance.setPrivilege, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
