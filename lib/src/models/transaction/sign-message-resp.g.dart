// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign-message-resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignMessageResp _$SignMessageRespFromJson(Map<String, dynamic> json) =>
    SignMessageResp(
      signData: json['signData'] as String?,
      publicKey: json['publicKey'] as String?,
    )
      ..errorCode = (json['error_code'] as num?)?.toInt()
      ..errorDesc = json['error_desc'] as String?;

Map<String, dynamic> _$SignMessageRespToJson(SignMessageResp instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'error_desc': instance.errorDesc,
      'signData': instance.signData,
      'publicKey': instance.publicKey,
    };
