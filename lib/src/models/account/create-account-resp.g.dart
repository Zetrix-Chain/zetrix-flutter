// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create-account-resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAccountResp _$CreateAccountRespFromJson(Map<String, dynamic> json) =>
    CreateAccountResp(
      result: json['result'] == null
          ? null
          : CreateAccountResult.fromJson(
              json['result'] as Map<String, dynamic>),
    )
      ..errorCode = (json['error_code'] as num?)?.toInt()
      ..errorDesc = json['error_desc'] as String?;

Map<String, dynamic> _$CreateAccountRespToJson(CreateAccountResp instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'error_desc': instance.errorDesc,
      'result': instance.result?.toJson(),
    };
