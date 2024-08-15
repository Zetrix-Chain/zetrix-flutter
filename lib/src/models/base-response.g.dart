// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base-response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse(
      errorCode: (json['error_code'] as num?)?.toInt(),
      errorDesc: json['error_desc'] as String?,
    );

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'error_desc': instance.errorDesc,
    };
