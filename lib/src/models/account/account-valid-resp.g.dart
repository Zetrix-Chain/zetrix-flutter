// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account-valid-resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountValidResp _$AccountValidRespFromJson(Map<String, dynamic> json) =>
    AccountValidResp(
      result: json['result'] == null
          ? null
          : AccountValidResult.fromJson(json['result'] as Map<String, dynamic>),
    )
      ..errorCode = (json['error_code'] as num?)?.toInt()
      ..errorDesc = json['error_desc'] as String?;

Map<String, dynamic> _$AccountValidRespToJson(AccountValidResp instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'error_desc': instance.errorDesc,
      'result': instance.result?.toJson(),
    };
