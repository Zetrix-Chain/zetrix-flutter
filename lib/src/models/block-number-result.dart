import 'package:freezed_annotation/freezed_annotation.dart';

import 'block-number-header.dart';

part 'block-number-result.g.dart';

@JsonSerializable(explicitToJson: true)
class BlockNumberResult {
  @JsonKey(name: "header")
  BlockNumberHeader? header;

  BlockNumberResult({this.header});

  factory BlockNumberResult.fromJson(Map<String, dynamic> json) =>
      _$BlockNumberResultFromJson(json);

  Map<String, dynamic> toJson() => _$BlockNumberResultToJson(this);

  static BlockNumberResult fromJsonModel(Map<String, dynamic> json) =>
      BlockNumberResult.fromJson(json);
}
