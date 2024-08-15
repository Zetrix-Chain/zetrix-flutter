// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-apply-resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcApplyResp _$VcApplyRespFromJson(Map<String, dynamic> json) => VcApplyResp(
      data: json['data'] == null
          ? null
          : VcApplyResult.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..errorCode = (json['errorCode'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$VcApplyRespToJson(VcApplyResp instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'message': instance.message,
      'data': instance.data,
    };
