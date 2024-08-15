import 'package:freezed_annotation/freezed_annotation.dart';

import 'attribute-key-value.dart';

part 'vc-attribute-content.g.dart';

@JsonSerializable()
class VcAttributeContent {
  @JsonKey(name: "attributes")
  List<AttributeKeyValue>? attributes;

  VcAttributeContent({this.attributes});

  factory VcAttributeContent.fromJson(Map<String, dynamic> json) =>
      _$VcAttributeContentFromJson(json);

  Map<String, dynamic> toJson() => _$VcAttributeContentToJson(this);

  static VcAttributeContent fromJsonModel(Map<String, dynamic> json) =>
      VcAttributeContent.fromJson(json);
}
