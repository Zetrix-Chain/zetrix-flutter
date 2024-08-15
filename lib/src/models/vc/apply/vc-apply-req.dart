import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/vc/apply/vc-attribute-content.dart';

part 'vc-apply-req.g.dart';

@JsonSerializable()
class VcApplyReq {
  @JsonKey(name: "content")
  VcAttributeContent? content;

  @JsonKey(name: "templateId")
  String? templateId;

  @JsonKey(name: "publicKey")
  String? publicKey;

  VcApplyReq({this.content, this.templateId, this.publicKey});

  factory VcApplyReq.fromJson(Map<String, dynamic> json) =>
      _$VcApplyReqFromJson(json);

  Map<String, dynamic> toJson() => _$VcApplyReqToJson(this);

  static VcApplyReq fromJsonModel(Map<String, dynamic> json) =>
      VcApplyReq.fromJson(json);
}
