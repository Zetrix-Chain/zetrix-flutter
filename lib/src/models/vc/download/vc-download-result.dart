import 'package:freezed_annotation/freezed_annotation.dart';

part 'vc-download-result.g.dart';

@JsonSerializable()
class VcDownloadResult {

  @JsonKey(name: "jws")
  String? jws;

  @JsonKey(name: "vcId")
  String? vcId;

  @JsonKey(name: "vc")
  String? vc;

  @JsonKey(name: "issuerBid")
  String? issuerBid;

  @JsonKey(name: "issuerAddress")
  String? issuerAddress;

  @JsonKey(name: "isDownload")
  int? isDownload;

  VcDownloadResult({
      this.jws,
      this.vcId,
      this.vc,
      this.issuerBid,
      this.issuerAddress,
      this.isDownload
  });

  factory VcDownloadResult.fromJson(Map<String, dynamic> json) =>
      _$VcDownloadResultFromJson(json);

  Map<String, dynamic> toJson() => _$VcDownloadResultToJson(this);

  static VcDownloadResult fromJsonModel(Map<String, dynamic> json) =>
      VcDownloadResult.fromJson(json);
}
