// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-verification-result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcVerificationResult _$VcVerificationResultFromJson(
        Map<String, dynamic> json) =>
    VcVerificationResult(
      issuerName: json['issuerName'] as String?,
      verificationTime: json['verificationTime'] as String?,
      credentialId: json['credentialId'] as String?,
      certificateName: json[' certificateName'] as String?,
      generalResult: json['generalResult'] as Map<String, dynamic>?,
      certificateIssueTime: json['certificateIssueTime:'] as String?,
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$VcVerificationResultToJson(
        VcVerificationResult instance) =>
    <String, dynamic>{
      'issuerName': instance.issuerName,
      'verificationTime': instance.verificationTime,
      'credentialId': instance.credentialId,
      ' certificateName': instance.certificateName,
      'generalResult': instance.generalResult,
      'certificateIssueTime:': instance.certificateIssueTime,
      'status': instance.status,
    };
