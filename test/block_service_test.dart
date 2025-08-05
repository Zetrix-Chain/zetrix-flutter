import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zetrix_flutter/zetrix_flutter.dart';

void main() {
  test('test getBlockNumber', () async {
    final service = ZetrixBlockService(false);

    ZetrixSDKResult<BlockNumber> resp = await service.getBlockNumber();
    BlockNumber? numberResp;
    resp.when(success: (obj) {
      numberResp = obj;
      if (kDebugMode) {
        print(numberResp?.toJson());
      }
    }, failure: (ZetrixSDKExceptions? error) {
      numberResp = null;
    });

    expect(numberResp, isNotNull);
  });
}
