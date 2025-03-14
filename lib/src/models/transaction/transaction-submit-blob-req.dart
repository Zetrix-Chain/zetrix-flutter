import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/common/signature.dart';
import 'package:zetrix_flutter/src/models/transaction/sign-message-resp.dart';
import 'package:zetrix_flutter/src/models/operations/base-operation.dart';

part 'transaction-submit-blob-req.g.dart';

@JsonSerializable()
class TransactionSubmitBlobReq {
  @JsonKey(name: "transaction_blob")
  String? transactionBlob;

  @JsonKey(name: "signatures")
  List<Signature>? signatures;

  TransactionSubmitBlobReq({this.transactionBlob, this.signatures});

  factory TransactionSubmitBlobReq.fromJson(Map<String, dynamic> json) =>
      _$TransactionSubmitBlobReqFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionSubmitBlobReqToJson(this);

  static TransactionSubmitBlobReq fromJsonModel(Map<String, dynamic> json) =>
      TransactionSubmitBlobReq.fromJson(json);
}
