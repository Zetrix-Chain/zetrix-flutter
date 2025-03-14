import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction-sign-req.g.dart';

@JsonSerializable()
class TransactionSignReq {
  @JsonKey(name: "blob")
  String? blob;

  @JsonKey(name: "private_keys")
  List<String>? privateKeys;

  TransactionSignReq({this.blob, this.privateKeys});

  factory TransactionSignReq.fromJson(Map<String, dynamic> json) =>
      _$TransactionSignReqFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionSignReqToJson(this);

  static TransactionSignReq fromJsonModel(Map<String, dynamic> json) =>
      TransactionSignReq.fromJson(json);
}
