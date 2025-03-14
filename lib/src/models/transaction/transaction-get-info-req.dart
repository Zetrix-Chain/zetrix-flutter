import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction-get-info-req.g.dart';

@JsonSerializable()
class TransactionGetInfoRequest {
  @JsonKey(name: "hash")
  String? hash;

  TransactionGetInfoRequest({this.hash});

  factory TransactionGetInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$TransactionGetInfoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionGetInfoRequestToJson(this);

  static TransactionGetInfoRequest fromJsonModel(Map<String, dynamic> json) =>
      TransactionGetInfoRequest.fromJson(json);
}
