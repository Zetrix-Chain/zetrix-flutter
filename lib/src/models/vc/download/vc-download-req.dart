import 'package:freezed_annotation/freezed_annotation.dart';

part 'vc-download-req.g.dart';

@JsonSerializable()
class VcDownloadReq {

  @JsonKey(name: "credentialId")
  String? credentialId;

  @JsonKey(name: "userAddress")
  String? userAddress;

  VcDownloadReq({
      this.credentialId,
  });

  factory VcDownloadReq.fromJson(Map<String, dynamic> json) =>
      _$VcDownloadReqFromJson(json);

  Map<String, dynamic> toJson() => _$VcDownloadReqToJson(this);

  static VcDownloadReq fromJsonModel(Map<String, dynamic> json) =>
      VcDownloadReq.fromJson(json);
}
