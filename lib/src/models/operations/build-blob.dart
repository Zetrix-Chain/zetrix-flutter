import 'package:freezed_annotation/freezed_annotation.dart';

import '../chain/operation.dart';

part 'build-blob.g.dart';

@JsonSerializable(explicitToJson: true)
class BuildBlob {
  @JsonKey(name: "source_address")
  String? sourceAddress;

  @JsonKey(name: "nonce")
  int? nonce;

  @JsonKey(name: "fee_limit")
  int? feeLimit;

  @JsonKey(name: "gas_price")
  int? gasPrice;

  @JsonKey(name: "operations")
  List<Operation>? operations;

  BuildBlob(
      {this.sourceAddress,
      this.nonce,
      this.feeLimit,
      this.gasPrice,
      this.operations});

  factory BuildBlob.fromJson(Map<String, dynamic> json) =>
      _$BuildBlobFromJson(json);

  Map<String, dynamic> toJson() => _$BuildBlobToJson(this);

  static BuildBlob fromJsonModel(Map<String, dynamic> json) =>
      BuildBlob.fromJson(json);
}
