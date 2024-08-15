import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/vc/download/vc-download-blob-result.dart';

import '../../base-response.dart';

part 'vc-download-blob-resp.g.dart';

@JsonSerializable()
class VcDownloadBlobResp extends BaseResponse {
  @JsonKey(name: "result")
  VcDownloadBlobResult? result;

  VcDownloadBlobResp({this.result});

  factory VcDownloadBlobResp.fromJson(Map<String, dynamic> json) =>
      _$VcDownloadBlobRespFromJson(json);

  Map<String, dynamic> toJson() => _$VcDownloadBlobRespToJson(this);

  static VcDownloadBlobResp fromJsonModel(Map<String, dynamic> json) =>
      VcDownloadBlobResp.fromJson(json);
}
