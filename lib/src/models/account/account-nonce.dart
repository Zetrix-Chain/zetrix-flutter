import 'package:json_annotation/json_annotation.dart';

part 'account-nonce.g.dart';

@JsonSerializable()
class AccountNonce extends JsonSerializable {
  int? nonce;

  AccountNonce({this.nonce});

  factory AccountNonce.fromJson(Map<String, dynamic> json) =>
      _$AccountNonceFromJson(json);

  Map<String, dynamic> toJson() => _$AccountNonceToJson(this);
}
