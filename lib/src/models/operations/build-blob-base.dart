import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/operations/create-account.dart';

part 'build-blob-base.g.dart';

@JsonSerializable()
class BuildBlobBase {
  @JsonKey(name: "source_address")
  String? sourceAddress;

  @JsonKey(name: "nonce")
  int? nonce;

  @JsonKey(name: "fee_limit")
  int? feeLimit;

  @JsonKey(name: "gas_price")
  int? gasPrice;

  BuildBlobBase(
      {this.sourceAddress,
      this.nonce,
      this.feeLimit,
      this.gasPrice});


  factory BuildBlobBase.fromJson(Map<String, dynamic> json) =>
      _$BuildBlobBaseFromJson(json);
  
  Map<String, dynamic> toJson() => _$BuildBlobBaseToJson(this);

  static BuildBlobBase fromJsonModel(Map<String, dynamic> json) =>
      BuildBlobBase.fromJson(json);
}
