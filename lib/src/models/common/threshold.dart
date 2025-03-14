import 'package:freezed_annotation/freezed_annotation.dart';

part 'threshold.g.dart';

@JsonSerializable()
class ThresholdP {
  @JsonKey(name: "tx_threshold")
  int? txThreshold;

  ThresholdP({this.txThreshold});

  factory ThresholdP.fromJson(Map<String, dynamic> json) =>
      _$ThresholdPFromJson(json);

  Map<String, dynamic> toJson() => _$ThresholdPToJson(this);

  static ThresholdP fromJsonModel(Map<String, dynamic> json) =>
      ThresholdP.fromJson(json);
}
