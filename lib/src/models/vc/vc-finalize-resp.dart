import 'package:freezed_annotation/freezed_annotation.dart';

import '../base-response.dart';

part 'vc-finalize-resp.g.dart';

@JsonSerializable()
class VcFinalizeResp extends BaseResponse {
  
  String? vc;

  VcFinalizeResp({this.vc});

  factory VcFinalizeResp.fromJson(Map<String, dynamic> json) =>
      _$VcFinalizeRespFromJson(json);

  Map<String, dynamic> toJson() => _$VcFinalizeRespToJson(this);

  static VcFinalizeResp fromJsonModel(Map<String, dynamic> json) =>
      VcFinalizeResp.fromJson(json);
}