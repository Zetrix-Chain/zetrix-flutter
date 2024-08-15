import 'package:freezed_annotation/freezed_annotation.dart';

part 'vc-qr-token-req.g.dart';

@JsonSerializable()
class VcQrTokenReq {

  @JsonKey(name: "chainType")
  String? chainType;

  @JsonKey(name: "blob")
  String? blob;

  @JsonKey(name: "signBlob")
  String? signBlob;

  @JsonKey(name: "publicKey")
  String? publicKey;

  @JsonKey(name: "address")
  String? address;

  VcQrTokenReq({
      this.chainType,
      this.blob,
      this.signBlob,
      this.publicKey,
      this.address,
      });

  factory VcQrTokenReq.fromJson(Map<String, dynamic> json) =>
      _$VcQrTokenReqFromJson(json);

  Map<String, dynamic> toJson() => _$VcQrTokenReqToJson(this);

  static VcQrTokenReq fromJsonModel(Map<String, dynamic> json) =>
      VcQrTokenReq.fromJson(json);
}
