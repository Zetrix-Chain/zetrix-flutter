import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/common/signature.dart';

part 'transaction-submit-req.g.dart';

@JsonSerializable()
class TransactionSubmitRequest {
  @JsonKey(name: "transaction_blob")
  String? transactionBlob;

  @JsonKey(name: "signatures")
  List<Signature>? signatures;

  TransactionSubmitRequest({this.transactionBlob, this.signatures});

  factory TransactionSubmitRequest.fromJson(Map<String, dynamic> json) =>
      _$TransactionSubmitRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionSubmitRequestToJson(this);

  static TransactionSubmitRequest fromJsonModel(Map<String, dynamic> json) =>
      TransactionSubmitRequest.fromJson(json);
}
