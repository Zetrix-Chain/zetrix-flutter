import 'package:freezed_annotation/freezed_annotation.dart';

import 'block-number-header.dart';

part 'block-number.g.dart';

@JsonSerializable(explicitToJson: true)
class BlockNumber extends JsonSerializable {
  @JsonKey(name: "header")
  BlockNumberHeader? header;

  BlockNumber({this.header});

  factory BlockNumber.fromJson(Map<String, dynamic> json) =>
      _$BlockNumberFromJson(json);

  Map<String, dynamic> toJson() => _$BlockNumberToJson(this);

  static BlockNumber fromJsonModel(Map<String, dynamic> json) =>
      BlockNumber.fromJson(json);
}
