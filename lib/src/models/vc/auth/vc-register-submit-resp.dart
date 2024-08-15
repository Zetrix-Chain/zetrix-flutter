import 'package:freezed_annotation/freezed_annotation.dart';

part 'vc-register-submit-resp.g.dart';

@JsonSerializable()
class VcRegisterSubmitResp {
  @JsonKey(name: "token")
  String? token;

  VcRegisterSubmitResp({this.token});

  factory VcRegisterSubmitResp.fromJson(Map<String, dynamic> json) =>
      _$VcRegisterSubmitRespFromJson(json);

  Map<String, dynamic> toJson() => _$VcRegisterSubmitRespToJson(this);

  static VcRegisterSubmitResp fromJsonModel(Map<String, dynamic> json) =>
      VcRegisterSubmitResp.fromJson(json);
}
