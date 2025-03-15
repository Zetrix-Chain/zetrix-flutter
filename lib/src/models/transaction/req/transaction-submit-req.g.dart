// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction-submit-req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionSubmitRequest _$TransactionSubmitRequestFromJson(
        Map<String, dynamic> json) =>
    TransactionSubmitRequest(
      transactionBlob: json['transaction_blob'] as String?,
      signatures: (json['signatures'] as List<dynamic>?)
          ?.map((e) => Signature.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TransactionSubmitRequestToJson(
        TransactionSubmitRequest instance) =>
    <String, dynamic>{
      'transaction_blob': instance.transactionBlob,
      'signatures': instance.signatures,
    };
