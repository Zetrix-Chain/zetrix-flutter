import 'package:freezed_annotation/freezed_annotation.dart';

part 'thresholds.g.dart';

@JsonSerializable()
class Thresholds {
  @JsonKey(name: "tx_threshold")
  int? txThreshold;

  Thresholds({this.txThreshold});

  factory Thresholds.fromJson(Map<String, dynamic> json) =>
      _$ThresholdsFromJson(json);

  Map<String, dynamic> toJson() => _$ThresholdsToJson(this);

  static Thresholds fromJsonModel(Map<String, dynamic> json) =>
      Thresholds.fromJson(json);
}
