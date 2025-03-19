import 'package:freezed_annotation/freezed_annotation.dart';

import '../../zetrix_flutter.dart';

part 'base-response-submit.g.dart';

@JsonSerializable(explicitToJson: true)
class BaseResponseSubmit extends JsonSerializable {
  @JsonKey(name: "results")
  List<TransactionSubmitBlobResult>? results;

  @JsonKey(name: "success_count")
  int? successCount;

  BaseResponseSubmit({this.results, this.successCount});

  factory BaseResponseSubmit.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseSubmitFromJson(json);
  Map<String, dynamic> toJson() => _$BaseResponseSubmitToJson(this);

}
