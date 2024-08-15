import 'package:freezed_annotation/freezed_annotation.dart';

part 'vc-info-req.g.dart';

@JsonSerializable()
class VcInfoReq {
  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "userAddress")
  String? userAddress;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "pageStart")
  int? pageStart;

  @JsonKey(name: "pageSize")
  int? pageSize;

  VcInfoReq(
      {this.name,
      this.userAddress,
      this.pageStart,
      this.pageSize,
      this.status});

  factory VcInfoReq.fromJson(Map<String, dynamic> json) =>
      _$VcInfoReqFromJson(json);

  Map<String, dynamic> toJson() => _$VcInfoReqToJson(this);

  static VcInfoReq fromJsonModel(Map<String, dynamic> json) =>
      VcInfoReq.fromJson(json);
}
