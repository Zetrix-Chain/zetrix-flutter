import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction-submit-blob-result.g.dart';

@JsonSerializable()
class TransactionSubmitBlobResult {
  @JsonKey(name: "hash")
  String? hash;

  TransactionSubmitBlobResult({this.hash});

  factory TransactionSubmitBlobResult.fromJson(Map<String, dynamic> json) =>
      _$TransactionSubmitBlobResultFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionSubmitBlobResultToJson(this);

  static TransactionSubmitBlobResult fromJsonModel(Map<String, dynamic> json) =>
      TransactionSubmitBlobResult.fromJson(json);
}
