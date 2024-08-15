// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-vp-proof.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcVpProof _$VcVpProofFromJson(Map<String, dynamic> json) => VcVpProof(
      type: json['type'] as String?,
      created: json['created'] as String?,
      verificationMethod: json['verificationMethod'],
      proofPurpose: json['proofPurpose'],
      jws: json['jws'],
    );

Map<String, dynamic> _$VcVpProofToJson(VcVpProof instance) => <String, dynamic>{
      'type': instance.type,
      'created': instance.created,
      'verificationMethod': instance.verificationMethod,
      'proofPurpose': instance.proofPurpose,
      'jws': instance.jws,
    };
