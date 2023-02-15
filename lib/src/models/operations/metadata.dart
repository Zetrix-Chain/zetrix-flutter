import 'package:freezed_annotation/freezed_annotation.dart';

part 'metadata.g.dart';

@JsonSerializable()
class Metadata {
  @JsonKey(name: "key")
  String? key;

  @JsonKey(name: "value")
  String? value;

  Metadata({this.key, this.value});

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);

  static Metadata fromJsonModel(Map<String, dynamic> json) =>
      Metadata.fromJson(json);
}
