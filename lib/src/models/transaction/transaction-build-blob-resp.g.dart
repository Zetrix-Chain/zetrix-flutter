// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction-build-blob-resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionBuildBlobResp _$TransactionBuildBlobRespFromJson(
        Map<String, dynamic> json) =>
    TransactionBuildBlobResp(
      result: json['result'] == null
          ? null
          : TransactionBuildBlobResult.fromJson(
              json['result'] as Map<String, dynamic>),
    )
      ..errorCode = (json['error_code'] as num?)?.toInt()
      ..errorDesc = json['error_desc'] as String?;

Map<String, dynamic> _$TransactionBuildBlobRespToJson(
        TransactionBuildBlobResp instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'error_desc': instance.errorDesc,
      'result': instance.result,
    };
