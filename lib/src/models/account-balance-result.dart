import 'base-response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account-balance-result.g.dart';

@JsonSerializable()
class AccountBalanceResult extends BaseResponse {
  int? balance;

  AccountBalanceResult({this.balance});

  factory AccountBalanceResult.fromJson(Map<String, dynamic> json) =>
      _$AccountBalanceResultFromJson(json);

  Map<String, dynamic> toJson() => _$AccountBalanceResultToJson(this);
}
