// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction-submit-blob-resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionSubmitBlobResp _$TransactionSubmitBlobRespFromJson(
        Map<String, dynamic> json) =>
    TransactionSubmitBlobResp(
      result: json['result'] == null
          ? null
          : TransactionSubmitBlobResult.fromJson(
              json['result'] as Map<String, dynamic>),
    )
      ..errorCode = (json['error_code'] as num?)?.toInt()
      ..errorDesc = json['error_desc'] as String?;

Map<String, dynamic> _$TransactionSubmitBlobRespToJson(
        TransactionSubmitBlobResp instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'error_desc': instance.errorDesc,
      'result': instance.result,
    };
