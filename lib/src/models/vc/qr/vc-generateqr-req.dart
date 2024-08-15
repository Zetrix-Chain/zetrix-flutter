import 'package:freezed_annotation/freezed_annotation.dart';

part 'vc-generateqr-req.g.dart';

@JsonSerializable()
class VcGenerateQrReq {

   @JsonKey(name: "blobId")
  String? blobId;

  @JsonKey(name: "signBlob")
  String? signBlob;

  @JsonKey(name: "publicKey")
  String? publicKey;

  @JsonKey(name: "userAddress")
  String? userAddress;

  VcGenerateQrReq({
      this.blobId,
      this.signBlob,
      this.publicKey,
      this.userAddress,
      });

  factory VcGenerateQrReq.fromJson(Map<String, dynamic> json) =>
      _$VcGenerateQrReqFromJson(json);

  Map<String, dynamic> toJson() => _$VcGenerateQrReqToJson(this);

  static VcGenerateQrReq fromJsonModel(Map<String, dynamic> json) =>
      VcGenerateQrReq.fromJson(json);
}
