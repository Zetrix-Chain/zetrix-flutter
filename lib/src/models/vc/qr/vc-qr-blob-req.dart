import 'package:freezed_annotation/freezed_annotation.dart';

part 'vc-qr-blob-req.g.dart';

@JsonSerializable()
class VcQrBlobReq {

  @JsonKey(name: "address")
  String? address;

  VcQrBlobReq({
    this.address
  });

  factory VcQrBlobReq.fromJson(Map<String, dynamic> json) =>
      _$VcQrBlobReqFromJson(json);

  Map<String, dynamic> toJson() => _$VcQrBlobReqToJson(this);

  static VcQrBlobReq fromJsonModel(Map<String, dynamic> json) =>
      VcQrBlobReq.fromJson(json);
}
