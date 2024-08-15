import 'package:freezed_annotation/freezed_annotation.dart';

part 'vc-register-submit-req.g.dart';

@JsonSerializable()
class VcRegisterSubmitReq {
  @JsonKey(name: "blobId")
  String? blobId;

  @JsonKey(name: "blobSign")
  String? blobSign;

  @JsonKey(name: "publicKey")
  String? publicKey;

  @JsonKey(name: "address")
  String? address;

  VcRegisterSubmitReq({this.blobId, this.blobSign, this.publicKey, this.address});

  factory VcRegisterSubmitReq.fromJson(Map<String, dynamic> json) =>
      _$VcRegisterSubmitReqFromJson(json);

  Map<String, dynamic> toJson() => _$VcRegisterSubmitReqToJson(this);

  static VcRegisterSubmitReq fromJsonModel(Map<String, dynamic> json) =>
      VcRegisterSubmitReq.fromJson(json);
}
