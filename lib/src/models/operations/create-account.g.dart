// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create-account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAccount _$CreateAccountFromJson(Map<String, dynamic> json) =>
    CreateAccount(
      type: (json['type'] as num?)?.toInt(),
      createAccount: json['create_account'] == null
          ? null
          : CreateAccountEntity.fromJson(
              json['create_account'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateAccountToJson(CreateAccount instance) =>
    <String, dynamic>{
      'type': instance.type,
      'create_account': instance.createAccount,
    };
