import 'package:freezed_annotation/freezed_annotation.dart';

part 'vc-general-string-resp.g.dart';

@JsonSerializable()
class VcGeneralStringResp {
  String? data;
  int? errorCode;
  String? message;

  VcGeneralStringResp({this.data, this.errorCode, this.message});

  factory VcGeneralStringResp.fromJson(Map<String, dynamic> json) =>
      _$VcGeneralStringRespFromJson(json);

  Map<String, dynamic> toJson() => _$VcGeneralStringRespToJson(this);
}
