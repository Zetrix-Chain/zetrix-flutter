import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/operations/base-operation.dart';
import 'package:zetrix_flutter/src/utils/operation-type.enum.dart';

part 'asset-send-operation.g.dart';

@JsonSerializable()
class AssetSendOperation extends BaseOperation {
  @JsonKey(name: "dest_address")
  String? destAddress;

  @JsonKey(name: "code")
  String? code;

  @JsonKey(name: "issuer")
  String? issuer;

  @JsonKey(name: "amount")
  int? amount;

  AssetSendOperation({this.destAddress, this.code, this.issuer, this.amount});

  factory AssetSendOperation.fromJson(Map<String, dynamic> json) =>
      _$AssetSendOperationFromJson(json);

  Map<String, dynamic> toJson() => _$AssetSendOperationToJson(this);

  static AssetSendOperation fromJsonModel(Map<String, dynamic> json) =>
      AssetSendOperation.fromJson(json);
}
