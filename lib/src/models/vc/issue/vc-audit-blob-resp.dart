import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/vc/issue/vc-audit-blob-result.dart';

import '../../base-response.dart';

part 'vc-audit-blob-resp.g.dart';

@JsonSerializable()
class VcAuditBlobResp extends BaseResponse {
  @JsonKey(name: "result")
  VcAuditBlobResult? result;

  VcAuditBlobResp({this.result});

  factory VcAuditBlobResp.fromJson(Map<String, dynamic> json) =>
      _$VcAuditBlobRespFromJson(json);

  Map<String, dynamic> toJson() => _$VcAuditBlobRespToJson(this);

  static VcAuditBlobResp fromJsonModel(Map<String, dynamic> json) =>
      VcAuditBlobResp.fromJson(json);
}
