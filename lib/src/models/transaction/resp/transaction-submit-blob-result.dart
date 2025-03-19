import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction-submit-blob-result.g.dart';

@JsonSerializable()
class TransactionSubmitBlobResult extends JsonSerializable {
  @JsonKey(name: "error_code")
  int? errorCode;
  @JsonKey(name: "error_desc")
  String? errorDesc;
  @JsonKey(name: "hash")
  String? hash;

  TransactionSubmitBlobResult({this.hash, this.errorDesc, this.errorCode});

  factory TransactionSubmitBlobResult.fromJson(Map<String, dynamic> json) =>
      _$TransactionSubmitBlobResultFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionSubmitBlobResultToJson(this);

  static TransactionSubmitBlobResult fromJsonModel(Map<String, dynamic> json) =>
      TransactionSubmitBlobResult.fromJson(json);
}
