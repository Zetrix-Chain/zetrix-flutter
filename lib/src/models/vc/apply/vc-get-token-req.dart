import 'package:freezed_annotation/freezed_annotation.dart';

part 'vc-get-token-req.g.dart';

@JsonSerializable()
class VcGetTokenReq {

  @JsonKey(name: "blobId")
  String? blobId;

  @JsonKey(name: "blobSign")
  String? blobSign;

  @JsonKey(name: "publicKey")
  String? publicKey;

  @JsonKey(name: "address")
  String? address;

  VcGetTokenReq({
      this.blobId,
      this.blobSign,
      this.publicKey,
      this.address,
      });

  factory VcGetTokenReq.fromJson(Map<String, dynamic> json) =>
      _$VcGetTokenReqFromJson(json);

  Map<String, dynamic> toJson() => _$VcGetTokenReqToJson(this);

  static VcGetTokenReq fromJsonModel(Map<String, dynamic> json) =>
      VcGetTokenReq.fromJson(json);
}
