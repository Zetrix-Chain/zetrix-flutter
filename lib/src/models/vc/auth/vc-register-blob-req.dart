import 'package:freezed_annotation/freezed_annotation.dart';

part 'vc-register-blob-req.g.dart';

@JsonSerializable()
class VcRegisterBlobReq {

  @JsonKey(name: "address")
  String? address;

  VcRegisterBlobReq({
    this.address
  });

  factory VcRegisterBlobReq.fromJson(Map<String, dynamic> json) =>
      _$VcRegisterBlobReqFromJson(json);

  Map<String, dynamic> toJson() => _$VcRegisterBlobReqToJson(this);

  static VcRegisterBlobReq fromJsonModel(Map<String, dynamic> json) =>
      VcRegisterBlobReq.fromJson(json);
}
