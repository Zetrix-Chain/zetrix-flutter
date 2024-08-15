import 'package:freezed_annotation/freezed_annotation.dart';

part 'attribute-key-value.g.dart';

@JsonSerializable()
class AttributeKeyValue {
  @JsonKey(name: "key")
  String? key;

  @JsonKey(name: "value")
  dynamic value;

  AttributeKeyValue({this.key, this.value});

  factory AttributeKeyValue.fromJson(Map<String, dynamic> json) =>
      _$AttributeKeyValueFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeKeyValueToJson(this);

  static AttributeKeyValue fromJsonModel(Map<String, dynamic> json) =>
      AttributeKeyValue.fromJson(json);
}
