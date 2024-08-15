import 'package:json_annotation/json_annotation.dart';
import 'package:zetrix_flutter/src/models/account-valid-result.dart';
import 'package:zetrix_flutter/src/models/base-response.dart';

part 'account-valid-resp.g.dart';

@JsonSerializable(explicitToJson: true)
class AccountValidResp extends BaseResponse {

  AccountValidResult? result;

  AccountValidResp({this.result});

  factory AccountValidResp.fromJson(Map<String, dynamic> json) => _$AccountValidRespFromJson(json);

  Map<String,dynamic> toJson() => _$AccountValidRespToJson(this);

}