import 'package:freezed_annotation/freezed_annotation.dart';

part 'vp-finalize-req.g.dart';

@JsonSerializable()
class VpFinalizeReq {
  @JsonKey(name: "holder")
  String? holder;

  @JsonKey(name: "vpjws")
  String? vpjws;

  VpFinalizeReq({this.holder, this.vpjws});

  factory VpFinalizeReq.fromJson(Map<String, dynamic> json) =>
      _$VpFinalizeReqFromJson(json);

  Map<String, dynamic> toJson() => _$VpFinalizeReqToJson(this);
}
