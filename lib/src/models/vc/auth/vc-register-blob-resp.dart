import 'package:freezed_annotation/freezed_annotation.dart';

part 'vc-register-blob-resp.g.dart';

@JsonSerializable()
class VcRegisterBlobResp {
  @JsonKey(name: "blobId")
  String? blobId;

  @JsonKey(name: "blob")
  String? blob;

  VcRegisterBlobResp({this.blobId, this.blob});

  factory VcRegisterBlobResp.fromJson(Map<String, dynamic> json) =>
      _$VcRegisterBlobRespFromJson(json);

  Map<String, dynamic> toJson() => _$VcRegisterBlobRespToJson(this);

  static VcRegisterBlobResp fromJsonModel(Map<String, dynamic> json) =>
      VcRegisterBlobResp.fromJson(json);
}
