import 'package:flutter/foundation.dart';
import 'package:zetrix_flutter/src/models/operations/build-blob.dart';
import 'package:zetrix_flutter/src/models/operations/create-account.dart';
import 'package:zetrix_flutter/src/services/base-rest.service.dart';
import 'package:zetrix_flutter/src/utils/transaction-builder.dart';

import '../models/api-result.dart';
import '../models/network-exceptions.dart';
import '../models/transaction-build-blob-req.dart';
import '../models/transaction-build-blob-resp.dart';

class TransactionService extends BaseRestService {
  final String _endPoint = '';

  Future<ApiResult<TransactionBuildBlobResp>> buildBlob(
      TransactionBuildBlobReq req) async {

    List<Object> objs =
    TransactionBuilder.build(req.operations!, req.sourceAddress!);

    BuildBlob<CreateAccount> reqData = BuildBlob<CreateAccount>();
    reqData.operations = objs.map((e) => e as CreateAccount).toList();
    reqData.sourceAddress = req.sourceAddress;
    reqData.feeLimit = req.feeLimit;
    reqData.gasPrice = req.gasPrice;
    reqData.nonce = req.nonce;

    Map<String,dynamic> test = reqData.toJson((json) => CreateAccount.fromJson(json as CreateAccount));
    print(test);

    var url = '$_endPoint/getTransactionBlob';

    try {
      // if(Tools.isEmptyObject(req)) {
      //   return ApiResult.failure(error: SDK)
      // }
      //
      final response = await dio.post(url, data: reqData);

      return ApiResult.success(data: TransactionBuildBlobResp.fromJson(response.data));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
