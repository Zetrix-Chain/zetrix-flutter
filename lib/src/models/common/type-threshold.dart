import 'package:freezed_annotation/freezed_annotation.dart';

part 'type-threshold.g.dart';

@JsonSerializable()
class TypeThreshold {
  
  @JsonKey(name: "type")
  int? type;
  
  @JsonKey(name: "threshold")
  int? threshold;

  TypeThreshold({this.type, this.threshold});

  factory TypeThreshold.fromJson(Map<String, dynamic> json) =>
      _$TypeThresholdFromJson(json);

  Map<String, dynamic> toJson() => _$TypeThresholdToJson(this);

  static TypeThreshold fromJsonModel(Map<String, dynamic> json) =>
      TypeThreshold.fromJson(json);
}
