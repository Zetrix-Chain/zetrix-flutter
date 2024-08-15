// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-general-string-resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcGeneralStringResp _$VcGeneralStringRespFromJson(Map<String, dynamic> json) =>
    VcGeneralStringResp(
      data: json['data'] as String?,
      errorCode: (json['errorCode'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$VcGeneralStringRespToJson(
        VcGeneralStringResp instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'message': instance.message,
    };
