// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-finalize-resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcFinalizeResp _$VcFinalizeRespFromJson(Map<String, dynamic> json) =>
    VcFinalizeResp(
      vc: json['vc'] as String?,
    )
      ..errorCode = (json['error_code'] as num?)?.toInt()
      ..errorDesc = json['error_desc'] as String?;

Map<String, dynamic> _$VcFinalizeRespToJson(VcFinalizeResp instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'error_desc': instance.errorDesc,
      'vc': instance.vc,
    };
