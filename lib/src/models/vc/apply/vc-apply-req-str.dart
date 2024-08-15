import 'package:freezed_annotation/freezed_annotation.dart';

part 'vc-apply-req-str.g.dart';

@JsonSerializable()
class VcApplyReqStr {
  @JsonKey(name: "content")
  String? content;

  @JsonKey(name: "templateId")
  String? templateId;

  @JsonKey(name: "publicKey")
  String? publicKey;

  VcApplyReqStr({this.content, this.templateId, this.publicKey});

  factory VcApplyReqStr.fromJson(Map<String, dynamic> json) =>
      _$VcApplyReqStrFromJson(json);

  Map<String, dynamic> toJson() => _$VcApplyReqStrToJson(this);

  static VcApplyReqStr fromJsonModel(Map<String, dynamic> json) =>
      VcApplyReqStr.fromJson(json);
}
