import 'package:json_annotation/json_annotation.dart';
import 'package:zetrix_flutter/src/models/base-response.dart';

import 'account-nonce-result.dart';

part 'account-nonce-resp.g.dart';

@JsonSerializable(explicitToJson: true)
class AccountNonceResp extends BaseResponse {

  AccountNonceResult? result;

  AccountNonceResp({this.result});

  factory AccountNonceResp.fromJson(json) => _$AccountNonceRespFromJson(json);

  Map<String,dynamic> toJson() => _$AccountNonceRespToJson(this);


}