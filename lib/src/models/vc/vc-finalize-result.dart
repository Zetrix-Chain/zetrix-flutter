import 'package:freezed_annotation/freezed_annotation.dart';

part 'vc-finalize-result.g.dart';

@JsonSerializable()
class VcFinalizeResult {
  String? vc;

  VcFinalizeResult({this.vc});

  factory VcFinalizeResult.fromJson(Map<String, dynamic> json) =>
      _$VcFinalizeResultFromJson(json);

  Map<String, dynamic> toJson() => _$VcFinalizeResultToJson(this);

  static VcFinalizeResult fromJsonModel(Map<String, dynamic> json) =>
      VcFinalizeResult.fromJson(json);
}
