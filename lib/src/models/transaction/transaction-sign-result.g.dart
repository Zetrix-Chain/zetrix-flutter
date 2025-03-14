// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction-sign-result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionSignResult _$TransactionSignResultFromJson(
        Map<String, dynamic> json) =>
    TransactionSignResult(
      signatures: (json['signatures'] as List<dynamic>?)
          ?.map((e) => Signature.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..errorCode = (json['error_code'] as num?)?.toInt()
      ..errorDesc = json['error_desc'] as String?;

Map<String, dynamic> _$TransactionSignResultToJson(
        TransactionSignResult instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'error_desc': instance.errorDesc,
      'signatures': instance.signatures,
    };
