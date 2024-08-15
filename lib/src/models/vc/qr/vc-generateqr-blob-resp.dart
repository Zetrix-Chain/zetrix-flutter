import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/vc/qr/vc-generateqr-blob-result.dart';

import '../../base-response.dart';

part 'vc-generateqr-blob-resp.g.dart';

@JsonSerializable()
class VcGenerateQrBlobResp extends BaseResponse {
  @JsonKey(name: "result")
  VcGenerateQrBlobResult? result;

  VcGenerateQrBlobResp({this.result});

  factory VcGenerateQrBlobResp.fromJson(Map<String, dynamic> json) =>
      _$VcGenerateQrBlobRespFromJson(json);

  Map<String, dynamic> toJson() => _$VcGenerateQrBlobRespToJson(this);

  static VcGenerateQrBlobResp fromJsonModel(Map<String, dynamic> json) =>
      VcGenerateQrBlobResp.fromJson(json);
}
