// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account-nonce-resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountNonceResp _$AccountNonceRespFromJson(Map<String, dynamic> json) =>
    AccountNonceResp(
      result: json['result'] == null
          ? null
          : AccountNonceResult.fromJson(json['result'] as Map<String, dynamic>),
    )
      ..errorCode = (json['error_code'] as num?)?.toInt()
      ..errorDesc = json['error_desc'] as String?;

Map<String, dynamic> _$AccountNonceRespToJson(AccountNonceResp instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'error_desc': instance.errorDesc,
      'result': instance.result?.toJson(),
    };
