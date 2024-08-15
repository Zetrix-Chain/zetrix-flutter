import 'package:freezed_annotation/freezed_annotation.dart';

part 'block-number-header.g.dart';

@JsonSerializable(explicitToJson: true)
class BlockNumberHeader {
  @JsonKey(name: "seq")
  int? blockNumber;

  BlockNumberHeader({this.blockNumber});

  factory BlockNumberHeader.fromJson(Map<String, dynamic> json) =>
      _$BlockNumberHeaderFromJson(json);

  Map<String, dynamic> toJson() => _$BlockNumberHeaderToJson(this);

  static BlockNumberHeader fromJsonModel(Map<String, dynamic> json) =>
      BlockNumberHeader.fromJson(json);
}
