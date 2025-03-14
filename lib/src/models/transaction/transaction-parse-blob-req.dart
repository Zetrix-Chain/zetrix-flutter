import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction-parse-blob-req.g.dart';

@JsonSerializable()
class TransactionParseBlobRequest {
  @JsonKey(name: "blob")
  String? blob;

  TransactionParseBlobRequest({this.blob});

  factory TransactionParseBlobRequest.fromJson(Map<String, dynamic> json) =>
      _$TransactionParseBlobRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionParseBlobRequestToJson(this);

  static TransactionParseBlobRequest fromJsonModel(Map<String, dynamic> json) =>
      TransactionParseBlobRequest.fromJson(json);
}
