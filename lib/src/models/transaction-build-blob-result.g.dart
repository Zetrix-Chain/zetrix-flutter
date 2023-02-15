// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction-build-blob-result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionBuildBlobResult _$TransactionBuildBlobResultFromJson(
        Map<String, dynamic> json) =>
    TransactionBuildBlobResult(
      transactionBlob: json['transaction_blob'] as String?,
      hash: json['hash'] as String?,
    );

Map<String, dynamic> _$TransactionBuildBlobResultToJson(
        TransactionBuildBlobResult instance) =>
    <String, dynamic>{
      'transaction_blob': instance.transactionBlob,
      'hash': instance.hash,
    };
