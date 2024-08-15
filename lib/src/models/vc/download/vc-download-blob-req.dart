import 'package:freezed_annotation/freezed_annotation.dart';

part 'vc-download-blob-req.g.dart';

@JsonSerializable()
class VcDownloadBlobReq {

  @JsonKey(name: "address")
  String? address;

  VcDownloadBlobReq({
      this.address,
  });

  factory VcDownloadBlobReq.fromJson(Map<String, dynamic> json) =>
      _$VcDownloadBlobReqFromJson(json);

  Map<String, dynamic> toJson() => _$VcDownloadBlobReqToJson(this);

  static VcDownloadBlobReq fromJsonModel(Map<String, dynamic> json) =>
      VcDownloadBlobReq.fromJson(json);
}
