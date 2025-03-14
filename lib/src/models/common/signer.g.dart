// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Signer _$SignerFromJson(Map<String, dynamic> json) => Signer(
      address: json['address'] as String?,
      weight: (json['weight'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SignerToJson(Signer instance) => <String, dynamic>{
      'address': instance.address,
      'weight': instance.weight,
    };
