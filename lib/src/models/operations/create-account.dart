import 'package:freezed_annotation/freezed_annotation.dart';

import 'create-account-entity.dart';

part 'create-account.g.dart';

@JsonSerializable()
class CreateAccount {
  @JsonKey(name: "type")
  int? type;

  @JsonKey(name: "create_account")
  CreateAccountEntity? createAccount;

  CreateAccount({this.type, this.createAccount});

  factory CreateAccount.fromJson(Map<String, dynamic> json) =>
      _$CreateAccountFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAccountToJson(this);

  static CreateAccount fromJsonModel(Map<String, dynamic> json) =>
      CreateAccount.fromJson(json);
}
