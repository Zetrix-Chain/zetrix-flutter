import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/vc/info/vc-detail-entity.dart';

part 'vc-info-resp.g.dart';

@JsonSerializable()
class VcInfoResp {
  @JsonKey(name: "pageSize")
  int? pageSize;

  @JsonKey(name: "pageStart")
  int? pageStart;

  @JsonKey(name: "total")
  int? total;

  @JsonKey(name: "rows")
  List<VcDetailEntity>? rows;

  VcInfoResp({this.pageSize, this.pageStart, this.total, this.rows});

  factory VcInfoResp.fromJson(Map<String, dynamic> json) =>
      _$VcInfoRespFromJson(json);

  Map<String, dynamic> toJson() => _$VcInfoRespToJson(this);

  static VcInfoResp fromJsonModel(Map<String, dynamic> json) =>
      VcInfoResp.fromJson(json);
}
