// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction-info-resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionInfoResp _$TransactionInfoRespFromJson(Map<String, dynamic> json) =>
    TransactionInfoResp(
      result: json['result'] as Map<String, dynamic>?,
    )
      ..errorCode = (json['error_code'] as num?)?.toInt()
      ..errorDesc = json['error_desc'] as String?;

Map<String, dynamic> _$TransactionInfoRespToJson(
        TransactionInfoResp instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'error_desc': instance.errorDesc,
      'result': instance.result,
    };
