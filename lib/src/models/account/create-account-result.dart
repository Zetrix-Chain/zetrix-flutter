import 'package:freezed_annotation/freezed_annotation.dart';

part 'create-account-result.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateAccountResult {

  @JsonKey(name: "privateKey")
  String? privateKey;

  @JsonKey(name: "publicKey")
  String? publicKey;

  @JsonKey(name: "address")
  String? address;

  CreateAccountResult(
      {this.privateKey,
      this.publicKey,
      this.address});

  factory CreateAccountResult.fromJson(Map<String, dynamic> json) =>
      _$CreateAccountResultFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAccountResultToJson(this);

  static CreateAccountResult fromJsonModel(Map<String, dynamic> json) =>
      CreateAccountResult.fromJson(json);

    // @override
    // String toString() {
    //   return '($privateKey, $publicKey, $address)';
    // }
}
