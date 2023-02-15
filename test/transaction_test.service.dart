import 'package:flutter_test/flutter_test.dart';
import 'package:zetrix_flutter/src/models/api-result.dart';
import 'package:zetrix_flutter/src/models/base-operation.dart';
import 'package:zetrix_flutter/src/models/network-exceptions.dart';
import 'package:zetrix_flutter/src/models/transaction-build-blob-req.dart';
import 'package:zetrix_flutter/src/models/transaction-build-blob-resp.dart';
import 'package:zetrix_flutter/src/services/transaction.service.dart';
import 'package:zetrix_flutter/src/utils/operation-type.enum.dart';


void main() {
  test('creating blob', () async {
    final service = TransactionService();

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

    ApiResult<TransactionBuildBlobResp> resp = await service.buildBlob(req);
    TransactionBuildBlobResp? blobResp;
    resp.when(success: (TransactionBuildBlobResp? obj)  {
      blobResp = obj;
      print(blobResp!.toJson().toString());
      print(blobResp!.result!.toJson().toString());
    }, failure: (NetworkExceptions? error)  {
      blobResp = null;
    });

    expect(blobResp, isNot(Null));
  });
}
