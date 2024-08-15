import 'package:freezed_annotation/freezed_annotation.dart';

part 'vc-audit-submit-req.g.dart';

@JsonSerializable()
class VcAuditSubmitReq {
  @JsonKey(name: "payloadId")
  String? payloadId;

  @JsonKey(name: "signPayload")
  String? signPayload;

  @JsonKey(name: "signBcTxBlob")
  String? signBcTxBlob;

  @JsonKey(name: "publicKey")
  String? publicKey;

  @JsonKey(name: "border")
  int? border;

  VcAuditSubmitReq(
      {this.payloadId,
      this.signPayload,
      this.signBcTxBlob,
      this.publicKey,
      this.border});

  factory VcAuditSubmitReq.fromJson(Map<String, dynamic> json) =>
      _$VcAuditSubmitReqFromJson(json);

  Map<String, dynamic> toJson() => _$VcAuditSubmitReqToJson(this);

  static VcAuditSubmitReq fromJsonModel(Map<String, dynamic> json) =>
      VcAuditSubmitReq.fromJson(json);
}
