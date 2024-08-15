// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-apply-req-str.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcApplyReqStr _$VcApplyReqStrFromJson(Map<String, dynamic> json) =>
    VcApplyReqStr(
      content: json['content'] as String?,
      templateId: json['templateId'] as String?,
      publicKey: json['publicKey'] as String?,
    );

Map<String, dynamic> _$VcApplyReqStrToJson(VcApplyReqStr instance) =>
    <String, dynamic>{
      'content': instance.content,
      'templateId': instance.templateId,
      'publicKey': instance.publicKey,
    };
