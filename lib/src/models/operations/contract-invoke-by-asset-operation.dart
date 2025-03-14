import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/operations/base-operation.dart';
import 'package:zetrix_flutter/src/utils/operation-type.enum.dart';

part 'contract-invoke-by-asset-operation.g.dart';

@JsonSerializable()
class ContractInvokeByAssetOperation extends BaseOperation {
  @JsonKey(name: "dest_address")
  String? contractAddress;

  @JsonKey(name: "code")
  String? code;

  @JsonKey(name: "issuer")
  String? issuer;

  @JsonKey(name: "asset_amount")
  int? assetAmount;

  @JsonKey(name: "input")
  String? input;

  ContractInvokeByAssetOperation(
      {this.contractAddress,
      this.code,
      this.issuer,
      this.assetAmount,
      this.input});

  factory ContractInvokeByAssetOperation.fromJson(Map<String, dynamic> json) =>
      _$ContractInvokeByAssetOperationFromJson(json);

  Map<String, dynamic> toJson() => _$ContractInvokeByAssetOperationToJson(this);

  static ContractInvokeByAssetOperation fromJsonModel(
          Map<String, dynamic> json) =>
      ContractInvokeByAssetOperation.fromJson(json);
}
