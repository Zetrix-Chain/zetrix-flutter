// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account-info-resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountInfoResp _$AccountInfoRespFromJson(Map<String, dynamic> json) =>
    AccountInfoResp(
      result: json['result'] == null
          ? null
          : AccountInfo.fromJson(json['result'] as Map<String, dynamic>),
    )
      ..errorCode = (json['error_code'] as num?)?.toInt()
      ..errorDesc = json['error_desc'] as String?;

Map<String, dynamic> _$AccountInfoRespToJson(AccountInfoResp instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'error_desc': instance.errorDesc,
      'result': instance.result?.toJson(),
    };
