import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/common/priv.dart';
import 'package:zetrix_flutter/src/models/operations/base-operation.dart';
import 'package:zetrix_flutter/src/utils/operation-type.enum.dart';

part 'account-activate-operation.g.dart';

@JsonSerializable()
class AccountActivateOperation extends BaseOperation {
  @JsonKey(name: "dest_address")
  String? destAddress;

  @JsonKey(name: "init_balance")
  String? initBalance;

  @JsonKey(name: "priv")
  Priv? priv;

  AccountActivateOperation({this.destAddress, this.initBalance, this.priv});

  factory AccountActivateOperation.fromJson(Map<String, dynamic> json) =>
      _$AccountActivateOperationFromJson(json);

  Map<String, dynamic> toJson() => _$AccountActivateOperationToJson(this);

  static AccountActivateOperation fromJsonModel(Map<String, dynamic> json) =>
      AccountActivateOperation.fromJson(json);
}
