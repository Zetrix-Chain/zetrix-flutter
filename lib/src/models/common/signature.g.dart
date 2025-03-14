// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Signature _$SignatureFromJson(Map<String, dynamic> json) => Signature(
      signData: json['sign_data'] as String?,
      publicKey: json['public_key'] as String?,
    );

Map<String, dynamic> _$SignatureToJson(Signature instance) => <String, dynamic>{
      'sign_data': instance.signData,
      'public_key': instance.publicKey,
    };
