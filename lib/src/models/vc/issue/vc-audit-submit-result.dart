import 'package:freezed_annotation/freezed_annotation.dart';

part 'vc-audit-submit-result.g.dart';

@JsonSerializable()
class VcAuditSubmitResult {

  @JsonKey(name: "did")
  String? did;


  VcAuditSubmitResult({
      this.did
  });

  factory VcAuditSubmitResult.fromJson(Map<String, dynamic> json) =>
      _$VcAuditSubmitResultFromJson(json);

  Map<String, dynamic> toJson() => _$VcAuditSubmitResultToJson(this);

  static VcAuditSubmitResult fromJsonModel(Map<String, dynamic> json) =>
      VcAuditSubmitResult.fromJson(json);
}
