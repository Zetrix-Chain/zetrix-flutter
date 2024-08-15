import 'package:freezed_annotation/freezed_annotation.dart';

part 'vc-audit-blob-req.g.dart';

@JsonSerializable()
class VcAuditBlobReq {

  @JsonKey(name: "applyNo")
  String? applyNo;

  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "reason")
  String? reason;

  VcAuditBlobReq(
      {this.applyNo,
      this.status,
      this.reason});

  factory VcAuditBlobReq.fromJson(Map<String, dynamic> json) =>
      _$VcAuditBlobReqFromJson(json);

  Map<String, dynamic> toJson() => _$VcAuditBlobReqToJson(this);

  static VcAuditBlobReq fromJsonModel(Map<String, dynamic> json) =>
      VcAuditBlobReq.fromJson(json);
}
