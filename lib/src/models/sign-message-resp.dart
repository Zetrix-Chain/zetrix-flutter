import 'package:json_annotation/json_annotation.dart';
import 'package:zetrix_flutter/src/models/base-response.dart';

part 'sign-message-resp.g.dart';

@JsonSerializable(explicitToJson: true)
class SignMessageResp extends BaseResponse {
  String? signData;
  String? publicKey;

  SignMessageResp({this.signData, this.publicKey});

  factory SignMessageResp.fromJson(json) => _$SignMessageRespFromJson(json);

  Map<String, dynamic> toJson() => _$SignMessageRespToJson(this);
}
