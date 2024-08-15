import 'package:freezed_annotation/freezed_annotation.dart';

part 'vc-verification-result.g.dart';

@JsonSerializable()
class VcVerificationResult {
  @JsonKey(name: "issuerName")
  String? issuerName;

  @JsonKey(name: "verificationTime")
  String? verificationTime;

  @JsonKey(name: "credentialId")
  String? credentialId;

  @JsonKey(name: " certificateName")
  String? certificateName;

  @JsonKey(name: "generalResult")
  Map<String, dynamic>? generalResult;

  @JsonKey(name: "certificateIssueTime:")
  String? certificateIssueTime;

  @JsonKey(name: "status")
  bool? status;

  VcVerificationResult(
      {this.issuerName,
      this.verificationTime,
      this.credentialId,
      this.certificateName,
      this.generalResult,
      this.certificateIssueTime,
      this.status});

  factory VcVerificationResult.fromJson(Map<String, dynamic> json) =>
      _$VcVerificationResultFromJson(json);

  Map<String, dynamic> toJson() => _$VcVerificationResultToJson(this);
}
