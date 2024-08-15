import 'package:json_annotation/json_annotation.dart';
import 'package:zetrix_flutter/src/models/base-response.dart';

import 'account-balance-result.dart';

part 'account-balance-resp.g.dart';

@JsonSerializable(explicitToJson: true)
class AccountBalanceResp extends BaseResponse {

  AccountBalanceResult? result;

  AccountBalanceResp({this.result});

  factory AccountBalanceResp.fromJson(json) => _$AccountBalanceRespFromJson(json);

  Map<String,dynamic> toJson() => _$AccountBalanceRespToJson(this);


}