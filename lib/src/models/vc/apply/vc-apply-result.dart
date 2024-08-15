import "package:freezed_annotation/freezed_annotation.dart";

part 'vc-apply-result.g.dart';

@JsonSerializable(explicitToJson: true)
class VcApplyResult {
  @JsonKey(name: "applyNo")
  String? applyNo;

  VcApplyResult(this.applyNo);

  factory VcApplyResult.fromJson(Map<String, dynamic> json) =>
      _$VcApplyResultFromJson(json);

  Map<String, dynamic> toJson() => _$VcApplyResultToJson(this);

  static VcApplyResult fromJsonModel(Map<String, dynamic> json) =>
      VcApplyResult.fromJson(json);
}
