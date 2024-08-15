// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base-response-msg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseMsg _$BaseResponseMsgFromJson(Map<String, dynamic> json) =>
    BaseResponseMsg(
      errorCode: (json['errorCode'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BaseResponseMsgToJson(BaseResponseMsg instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'message': instance.message,
    };
