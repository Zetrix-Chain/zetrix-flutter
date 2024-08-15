import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zetrix_flutter/src/models/api-result.dart';
import 'package:zetrix_flutter/src/models/block-number-resp.dart';
import 'package:zetrix_flutter/src/models/network-exceptions.dart';
import 'package:zetrix_flutter/zetrix_flutter.dart';

void main() {
  test('test getBlockNumber', () async {
    final service = ZetrixBlockService(false);

    ApiResult<BlockNumberResp> resp = await service.getBlockNumber();
    BlockNumberResp? numberResp;
    resp.when(success: (obj) {
      numberResp = obj;
      if (kDebugMode) {
        print(numberResp?.toJson());
      }
    }, failure: (NetworkExceptions? error) {
      numberResp = null;
    });

    expect(numberResp, isNotNull);
  });
}
