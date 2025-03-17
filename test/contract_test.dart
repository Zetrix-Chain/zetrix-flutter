import 'package:flutter_test/flutter_test.dart';
import 'package:zetrix_flutter/zetrix_flutter.dart';

void main() {
  final service = ZetrixContractService(false);

  test('Create account', () async {
    ContractCallReq req = ContractCallReq();
    req.sourceAddress = "ZTX3XDeQk86zpZqM7k2xCBDD75oZ7gk3M3Gnc";
    req.contractAddress = "ZTX3aymXGbrB7DtiDGkdivkS1Q3rYkcC9kucv";
    req.optType = 2;
    req.feeLimit = 1000000;
    req.gasPrice = 10;
    req.input =
        '{"method": "balanceOf", "params": {"address":"ZTX3XDeQk86zpZqM7k2xCBDD75oZ7gk3M3Gnc"}}';
    Object? finalResp;
    ZetrixSDKResult<ContractCallResult> resp = await service.call(req);

    resp.when(success: (ContractCallResult? obj) {
      if (obj != null) {
        finalResp = obj.queryRets![0];
        print(finalResp!.toString());
      }
    }, failure: (ZetrixSDKExceptions? error) {
      finalResp = null;
    });

    expect(finalResp, isNotNull);
  });
}
