import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/vc/download/vc-download-token-result.dart';

import '../../base-response.dart';

part 'vc-download-token-resp.g.dart';

@JsonSerializable()
class VcDownloadTokenResp extends BaseResponse {
  @JsonKey(name: "result")
  VcDownloadTokenResult? result;

  VcDownloadTokenResp({this.result});

  factory VcDownloadTokenResp.fromJson(Map<String, dynamic> json) =>
      _$VcDownloadTokenRespFromJson(json);

  Map<String, dynamic> toJson() => _$VcDownloadTokenRespToJson(this);

  static VcDownloadTokenResp fromJsonModel(Map<String, dynamic> json) =>
      VcDownloadTokenResp.fromJson(json);
}
