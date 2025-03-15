import 'package:freezed_annotation/freezed_annotation.dart';

part 'create-account.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateAccount extends JsonSerializable {
  @JsonKey(name: "privateKey")
  String? privateKey;

  @JsonKey(name: "publicKey")
  String? publicKey;

  @JsonKey(name: "address")
  String? address;

  CreateAccount({this.privateKey, this.publicKey, this.address});

  factory CreateAccount.fromJson(Map<String, dynamic> json) =>
      _$CreateAccountFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAccountToJson(this);

  static CreateAccount fromJsonModel(Map<String, dynamic> json) =>
      CreateAccount.fromJson(json);
}
