// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vp-presentation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifiablePresentation _$VerifiablePresentationFromJson(
        Map<String, dynamic> json) =>
    VerifiablePresentation(
      context: (json['@context'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      type: (json['type'] as List<dynamic>?)?.map((e) => e as String).toList(),
      credentialRequest: json['credentialRequest'] as String?,
      credentialParse: (json['credentialParse'] as List<dynamic>?)
          ?.map((e) => CredentialParse.fromJson(e as Map<String, dynamic>))
          .toList(),
      verifiableCredential: (json['verifiableCredential'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      proof: json['proof'] == null
          ? null
          : VcVpProof.fromJson(json['proof'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VerifiablePresentationToJson(
        VerifiablePresentation instance) =>
    <String, dynamic>{
      '@context': instance.context,
      'type': instance.type,
      'credentialRequest': instance.credentialRequest,
      'credentialParse': instance.credentialParse,
      'verifiableCredential': instance.verifiableCredential,
      'proof': instance.proof,
    };
