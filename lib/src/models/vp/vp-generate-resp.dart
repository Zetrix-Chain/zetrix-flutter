import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/vp/vp-presentation.dart';

import '../base-response.dart';

part 'vp-generate-resp.g.dart';

@JsonSerializable()
class VpGenerateResp extends BaseResponse {
  VerifiablePresentation? vp;

  VpGenerateResp({this.vp});

  factory VpGenerateResp.fromJson(Map<String, dynamic> json) =>
      _$VpGenerateRespFromJson(json);

  Map<String, dynamic> toJson() => _$VpGenerateRespToJson(this);

  static VpGenerateResp fromJsonModel(Map<String, dynamic> json) =>
      VpGenerateResp.fromJson(json);
}
