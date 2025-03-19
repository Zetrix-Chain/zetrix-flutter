// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction-submit-blob-result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionSubmitBlobResult _$TransactionSubmitBlobResultFromJson(
        Map<String, dynamic> json) =>
    TransactionSubmitBlobResult(
      hash: json['hash'] as String?,
      errorDesc: json['error_desc'] as String?,
      errorCode: (json['error_code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TransactionSubmitBlobResultToJson(
        TransactionSubmitBlobResult instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'error_desc': instance.errorDesc,
      'hash': instance.hash,
    };
