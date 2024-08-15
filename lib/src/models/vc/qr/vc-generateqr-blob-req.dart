import 'package:freezed_annotation/freezed_annotation.dart';

part 'vc-generateqr-blob-req.g.dart';

@JsonSerializable()
class VcGenerateQrBlobReq {

  @JsonKey(name: "userAddress")
  String? userAddress;

  @JsonKey(name: "jws")
  String? jws;

  @JsonKey(name: "contentAssert")
  String? contentAssert;

  @JsonKey(name: "vcId")
  String? vcId;

  VcGenerateQrBlobReq({
      this.userAddress,
      this.jws,
      this.contentAssert,
      this.vcId,
      });

  factory VcGenerateQrBlobReq.fromJson(Map<String, dynamic> json) =>
      _$VcGenerateQrBlobReqFromJson(json);

  Map<String, dynamic> toJson() => _$VcGenerateQrBlobReqToJson(this);

  static VcGenerateQrBlobReq fromJsonModel(Map<String, dynamic> json) =>
      VcGenerateQrBlobReq.fromJson(json);
}
