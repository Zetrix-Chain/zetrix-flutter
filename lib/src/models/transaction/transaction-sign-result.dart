import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zetrix_flutter/src/models/common/signature.dart';
import 'package:zetrix_flutter/src/models/transaction/transaction-submit-blob-result.dart';

import 'package:zetrix_flutter/src/models/base-response.dart';

part 'transaction-sign-result.g.dart';

@JsonSerializable()
class TransactionSignResult extends BaseResponse {
  @JsonKey(name: "signatures")
  List<Signature>? signatures;

  TransactionSignResult({this.signatures});

  factory TransactionSignResult.fromJson(Map<String, dynamic> json) =>
      _$TransactionSignResultFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionSignResultToJson(this);

  static TransactionSignResult fromJsonModel(Map<String, dynamic> json) =>
      TransactionSignResult.fromJson(json);
}
