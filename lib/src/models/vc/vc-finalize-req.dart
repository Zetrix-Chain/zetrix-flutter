import 'package:freezed_annotation/freezed_annotation.dart';

part 'vc-finalize-req.g.dart';

@JsonSerializable()
class VcFinalizeReq {
  @JsonKey(name: "vc")
  String? vc;

  @JsonKey(name: "issuer")
  String? issuer;

  @JsonKey(name: "jws")
  String? vcjws;

  VcFinalizeReq({this.vc, this.issuer, this.vcjws});

  factory VcFinalizeReq.fromJson(Map<String, dynamic> json) =>
      _$VcFinalizeReqFromJson(json);

  Map<String, dynamic> toJson() => _$VcFinalizeReqToJson(this);
}
