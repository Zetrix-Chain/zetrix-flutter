import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zetrix_flutter/src/models/sdk-result.dart';
import 'package:zetrix_flutter/src/models/base-operation.dart';
import 'package:zetrix_flutter/src/models/network-exceptions.dart';
import 'package:zetrix_flutter/src/models/transaction-build-blob-req.dart';
import 'package:zetrix_flutter/src/models/transaction-build-blob-resp.dart';
import 'package:zetrix_flutter/src/models/transaction-info-resp.dart';
import 'package:zetrix_flutter/src/services/transaction.service.dart';
import 'package:zetrix_flutter/src/utils/operation-type.enum.dart';

void main() {
  final service = ZetrixTransactionService(false);

  test('creating blob', () async {
    TransactionBuildBlobReq req = TransactionBuildBlobReq();
    req.sourceAddress = 'ZTX3KYJ7V3xyqox7yXAXxoiZ5DE8QdV6hXE1W';
    req.nonce = 440;
    req.feeLimit = 35892000;
    req.gasPrice = 10;

    List<BaseOperation> operations = [];
    BaseOperation op = BaseOperation();
    op.operationType = OperationType.ACCOUNT_ACTIVATE;
    op.sourceAddress = 'ZTX3KYJ7V3xyqox7yXAXxoiZ5DE8QdV6hXE1W';
    op.operations = '';
    operations.add(op);
    req.operations = operations;

    SDKResult<TransactionBuildBlobResp> resp = await service.buildBlob(req);
    TransactionBuildBlobResp? blobResp;
    resp.when(success: (TransactionBuildBlobResp? obj) {
      blobResp = obj;
      if (kDebugMode) {
        print(blobResp!.toJson().toString());
      }
    }, failure: (NetworkExceptions? error) {
      blobResp = null;
    });

    expect(blobResp, isNotNull);
  });

  test('get tx history', () async {
    String hash =
        '33e3df28879dae5a8d9c6c4b0317a96005d458d503a1c72a2297af8cf53ca55b';

    SDKResult<TransactionInfoResp> resp =
        await service.getTransactionHistory(hash);
    TransactionInfoResp? infoResp;
    resp.when(success: (obj) {
      infoResp = obj;
      if (kDebugMode) {
        print(infoResp!.result);
      }
    }, failure: (NetworkExceptions? error) {
      infoResp = null;
    });

    expect(infoResp, isNotNull);
  });
}
