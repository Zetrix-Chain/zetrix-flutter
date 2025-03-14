import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'network-exceptions.dart';

part 'sdk-result.freezed.dart';

@freezed
abstract class SDKResult<T> with _$SDKResult<T> {
  const factory SDKResult.success({T? data}) = Success<T>;

  const factory SDKResult.failure({NetworkExceptions? error}) = Failure<T>;
}
