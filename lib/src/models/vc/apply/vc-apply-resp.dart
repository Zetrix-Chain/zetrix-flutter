import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/vc/apply/vc-apply-result.dart';

import '../../base-response-msg.dart';

part 'vc-apply-resp.g.dart';

@JsonSerializable()
class VcApplyResp extends BaseResponseMsg {
  VcApplyResult? data;

  VcApplyResp({this.data});

  factory VcApplyResp.fromJson(Map<String, dynamic> json) =>
      _$VcApplyRespFromJson(json);

  Map<String, dynamic> toJson() => _$VcApplyRespToJson(this);

  static VcApplyResp fromJsonModel(Map<String, dynamic> json) =>
      VcApplyResp.fromJson(json);
}
