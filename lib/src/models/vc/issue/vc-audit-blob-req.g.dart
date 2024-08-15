// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-audit-blob-req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcAuditBlobReq _$VcAuditBlobReqFromJson(Map<String, dynamic> json) =>
    VcAuditBlobReq(
      applyNo: json['applyNo'] as String?,
      status: json['status'] as String?,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$VcAuditBlobReqToJson(VcAuditBlobReq instance) =>
    <String, dynamic>{
      'applyNo': instance.applyNo,
      'status': instance.status,
      'reason': instance.reason,
    };
