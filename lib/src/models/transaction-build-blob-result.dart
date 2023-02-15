import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart';

import 'base-operation.dart';

part 'transaction-build-blob-result.g.dart';

@JsonSerializable()
class TransactionBuildBlobResult {

  @JsonKey(name: "transaction_blob")
  String? transactionBlob;

  @JsonKey(name: "hash")
  String? hash;

  TransactionBuildBlobResult(
      {this.transactionBlob,
      this.hash});

  factory TransactionBuildBlobResult.fromJson(Map<String, dynamic> json) =>
      _$TransactionBuildBlobResultFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionBuildBlobResultToJson(this);

  static TransactionBuildBlobResult fromJsonModel(Map<String, dynamic> json) =>
      TransactionBuildBlobResult.fromJson(json);
}
