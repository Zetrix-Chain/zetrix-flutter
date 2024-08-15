import 'package:json_annotation/json_annotation.dart';
import 'package:zetrix_flutter/src/models/base-response.dart';

part 'sign-blob-resp.g.dart';

@JsonSerializable(explicitToJson: true)
class SignBlobResp extends BaseResponse {
  String? signBlob;
  String? publicKey;

  SignBlobResp({this.signBlob, this.publicKey});

  factory SignBlobResp.fromJson(json) => _$SignBlobRespFromJson(json);

  Map<String, dynamic> toJson() => _$SignBlobRespToJson(this);
}
