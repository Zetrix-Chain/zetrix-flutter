import 'package:freezed_annotation/freezed_annotation.dart';

part 'vp-generate-req.g.dart';

@JsonSerializable()
class VpGenerateReq {
  @JsonKey(name: "holder")
  String? holder;

  @JsonKey(name: "finalizedVc")
  String? finalizedVc;

  @JsonKey(name: "jws")
  String? jws;

  VpGenerateReq({this.holder, this.finalizedVc, this.jws});

  factory VpGenerateReq.fromJson(Map<String, dynamic> json) =>
      _$VpGenerateReqFromJson(json);

  Map<String, dynamic> toJson() => _$VpGenerateReqToJson(this);

  static VpGenerateReq fromJsonModel(Map<String, dynamic> json) =>
      VpGenerateReq.fromJson(json);
}
