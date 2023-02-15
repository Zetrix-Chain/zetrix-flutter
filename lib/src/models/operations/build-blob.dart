import 'package:freezed_annotation/freezed_annotation.dart';

part 'build-blob.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BuildBlob<T> {
  @JsonKey(name: "source_address")
  String? sourceAddress;

  @JsonKey(name: "nonce")
  int? nonce;

  @JsonKey(name: "fee_limit")
  int? feeLimit;

  @JsonKey(name: "gas_price")
  int? gasPrice;

  @JsonKey(name: "operations")
  List<T>? operations;

  BuildBlob(
      {this.sourceAddress,
      this.nonce,
      this.feeLimit,
      this.gasPrice,
      this.operations});

  factory BuildBlob.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BuildBlobFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(T Function(Object? json) fromJsonT) =>
      _$BuildBlobToJson(this, fromJsonT);
}
