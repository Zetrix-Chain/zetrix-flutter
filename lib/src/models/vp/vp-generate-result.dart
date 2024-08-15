import 'package:json_annotation/json_annotation.dart';

part 'vp-generate-result.g.dart';

@JsonSerializable()
class VpGenerateResult {
  @JsonKey(name: "jws")
  String? jws;

  VpGenerateResult();

  factory VpGenerateResult.fromJson(Map<String, dynamic> json) =>
      _$VpGenerateResultFromJson(json);

  Map<String, dynamic> toJson() => _$VpGenerateResultToJson(this);
}
