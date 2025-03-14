// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction-sign-resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionSignResp _$TransactionSignRespFromJson(Map<String, dynamic> json) =>
    TransactionSignResp(
      result: json['result'] == null
          ? null
          : TransactionSubmitBlobResult.fromJson(
              json['result'] as Map<String, dynamic>),
    )
      ..errorCode = (json['error_code'] as num?)?.toInt()
      ..errorDesc = json['error_desc'] as String?;

Map<String, dynamic> _$TransactionSignRespToJson(
        TransactionSignResp instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'error_desc': instance.errorDesc,
      'result': instance.result,
    };
