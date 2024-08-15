import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/vc/apply/vc-get-token-result.dart';

import '../../base-response.dart';

part 'vc-audit-submit-resp.g.dart';

@JsonSerializable()
class VcAuditSubmitResp extends BaseResponse {
  @JsonKey(name: "result")
  VcGetTokenResult? result;

  VcAuditSubmitResp({this.result});

  factory VcAuditSubmitResp.fromJson(Map<String, dynamic> json) =>
      _$VcAuditSubmitRespFromJson(json);

  Map<String, dynamic> toJson() => _$VcAuditSubmitRespToJson(this);

  static VcAuditSubmitResp fromJsonModel(Map<String, dynamic> json) =>
      VcAuditSubmitResp.fromJson(json);
}
