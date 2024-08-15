// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-apply-req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcApplyReq _$VcApplyReqFromJson(Map<String, dynamic> json) => VcApplyReq(
      content: json['content'] == null
          ? null
          : VcAttributeContent.fromJson(
              json['content'] as Map<String, dynamic>),
      templateId: json['templateId'] as String?,
      publicKey: json['publicKey'] as String?,
    );

Map<String, dynamic> _$VcApplyReqToJson(VcApplyReq instance) =>
    <String, dynamic>{
      'content': instance.content,
      'templateId': instance.templateId,
      'publicKey': instance.publicKey,
    };
