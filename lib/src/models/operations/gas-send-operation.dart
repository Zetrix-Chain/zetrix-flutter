import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/operations/base-operation.dart';
import 'package:zetrix_flutter/src/utils/operation-type.enum.dart';

part 'gas-send-operation.g.dart';

@JsonSerializable()
class GasSendOperation extends BaseOperation {
  @JsonKey(name: "dest_address")
  String? destAddress;

  @JsonKey(name: "amount")
  int? amount;

  GasSendOperation({this.destAddress, this.amount});

  factory GasSendOperation.fromJson(Map<String, dynamic> json) =>
      _$GasSendOperationFromJson(json);

  Map<String, dynamic> toJson() => _$GasSendOperationToJson(this);

  static GasSendOperation fromJsonModel(Map<String, dynamic> json) =>
      GasSendOperation.fromJson(json);
}
