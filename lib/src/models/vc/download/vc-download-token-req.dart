import 'package:freezed_annotation/freezed_annotation.dart';

part 'vc-download-token-req.g.dart';

@JsonSerializable()
class VcDownloadTokenReq {

  @JsonKey(name: "signBlob")
  String? signBlob;

  @JsonKey(name: "publicKey")
  String? publicKey;

  @JsonKey(name: "address")
  String? address;

  @JsonKey(name: "blob")
  String? blob;

  VcDownloadTokenReq({
      this.blob,
      this.signBlob,
      this.publicKey,
      this.address,
      });

  factory VcDownloadTokenReq.fromJson(Map<String, dynamic> json) =>
      _$VcDownloadTokenReqFromJson(json);

  Map<String, dynamic> toJson() => _$VcDownloadTokenReqToJson(this);

  static VcDownloadTokenReq fromJsonModel(Map<String, dynamic> json) =>
      VcDownloadTokenReq.fromJson(json);
}
