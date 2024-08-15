// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc-attribute-content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcAttributeContent _$VcAttributeContentFromJson(Map<String, dynamic> json) =>
    VcAttributeContent(
      attributes: (json['attributes'] as List<dynamic>?)
          ?.map((e) => AttributeKeyValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VcAttributeContentToJson(VcAttributeContent instance) =>
    <String, dynamic>{
      'attributes': instance.attributes,
    };
