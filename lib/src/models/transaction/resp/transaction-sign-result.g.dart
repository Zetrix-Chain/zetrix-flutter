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
    );

Map<String, dynamic> _$TransactionSignResultToJson(
        TransactionSignResult instance) =>
    <String, dynamic>{
      'signatures': instance.signatures,
    };
