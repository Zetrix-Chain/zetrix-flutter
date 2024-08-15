import 'package:freezed_annotation/freezed_annotation.dart';

part 'vc-detail-entity.g.dart';

@JsonSerializable()
class VcDetailEntity {
  @JsonKey(name: "issuerBid")
  String? issuerBid;

  @JsonKey(name: "issuerName")
  String? issuerName;

  @JsonKey(name: "vcId")
  String? vcId;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "isSel")
  int? isSel;

  @JsonKey(name: "isDownload")
  int? isDownload;

  @JsonKey(name: "startTime")
  String? startTime;

  @JsonKey(name: "endTime")
  String? endTime;

  VcDetailEntity(
      {this.issuerBid,
      this.vcId,
      this.name,
      this.status,
      this.isSel,
      this.isDownload,
      this.startTime,
      this.endTime});

  factory VcDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$VcDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => _$VcDetailEntityToJson(this);

  static VcDetailEntity fromJsonModel(Map<String, dynamic> json) =>
      VcDetailEntity.fromJson(json);
}
