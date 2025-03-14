// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction-submit-blob-req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionSubmitBlobReq _$TransactionSubmitBlobReqFromJson(
        Map<String, dynamic> json) =>
    TransactionSubmitBlobReq(
      transactionBlob: json['transaction_blob'] as String?,
      signatures: (json['signatures'] as List<dynamic>?)
          ?.map((e) => Signature.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TransactionSubmitBlobReqToJson(
        TransactionSubmitBlobReq instance) =>
    <String, dynamic>{
      'transaction_blob': instance.transactionBlob,
      'signatures': instance.signatures,
    };
