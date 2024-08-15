import 'package:json_annotation/json_annotation.dart';

part 'account-nonce-result.g.dart';

@JsonSerializable()
class AccountNonceResult{
  int? nonce;

  AccountNonceResult({this.nonce});

  factory AccountNonceResult.fromJson(Map<String,dynamic> json) => _$AccountNonceResultFromJson(json);

  Map<String, dynamic> toJson() => _$AccountNonceResultToJson(this);

}