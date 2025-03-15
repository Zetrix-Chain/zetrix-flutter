import 'package:json_annotation/json_annotation.dart';

part 'account-balance.g.dart';

@JsonSerializable()
class AccountBalance extends JsonSerializable {
  int? balance;

  AccountBalance({this.balance});

  factory AccountBalance.fromJson(Map<String, dynamic> json) =>
      _$AccountBalanceFromJson(json);

  Map<String, dynamic> toJson() => _$AccountBalanceToJson(this);
}
