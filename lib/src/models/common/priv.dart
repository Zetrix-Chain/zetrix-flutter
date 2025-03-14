import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/common/threshold.dart';

part 'priv.g.dart';

@JsonSerializable(explicitToJson: true)
class Priv {
  @JsonKey(name: "thresholds")
  ThresholdP? threshold;

  @JsonKey(name: 'master_weight')
  int? masterWeight;

  Priv({this.threshold, this.masterWeight});

  factory Priv.fromJson(Map<String, dynamic> json) => _$PrivFromJson(json);

  Map<String, dynamic> toJson() => _$PrivToJson(this);

  static Priv fromJsonModel(Map<String, dynamic> json) => Priv.fromJson(json);
}
