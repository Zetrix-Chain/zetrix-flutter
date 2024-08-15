import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vc-vp-proof.g.dart';

@JsonSerializable()
class VcVpProof {
  @JsonKey(name: "type")
  String? type;

  @JsonKey(name: "created")
  String? created;

  @JsonKey(name: "verificationMethod")
  dynamic verificationMethod;

  @JsonKey(name: "proofPurpose")
  dynamic proofPurpose;

  @JsonKey(name: "jws")
  dynamic jws;

  VcVpProof(
      {this.type,
      this.created,
      this.verificationMethod,
      this.proofPurpose,
      this.jws});

  factory VcVpProof.fromJson(Map<String, dynamic> json) =>
      _$VcVpProofFromJson(json);

  Map<String, dynamic> toJson() => _$VcVpProofToJson(this);
}
