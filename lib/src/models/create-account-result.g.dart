// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create-account-result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAccountResult _$CreateAccountResultFromJson(Map<String, dynamic> json) =>
    CreateAccountResult(
      privateKey: json['privateKey'] as String?,
      publicKey: json['publicKey'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$CreateAccountResultToJson(
        CreateAccountResult instance) =>
    <String, dynamic>{
      'privateKey': instance.privateKey,
      'publicKey': instance.publicKey,
      'address': instance.address,
    };
