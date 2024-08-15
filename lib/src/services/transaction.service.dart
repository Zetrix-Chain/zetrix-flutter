import 'package:flutter/foundation.dart';
import 'package:zetrix_flutter/src/models/operations/build-blob.dart';
import 'package:zetrix_flutter/src/models/operations/create-account.dart';
import 'package:zetrix_flutter/src/services/base_node.service.dart';
import 'package:zetrix_flutter/src/utils/sdk-error.enum.dart';
import 'package:zetrix_flutter/src/utils/tools.dart';
import 'package:zetrix_flutter/src/utils/transaction_builder.dart';

import '../models/api-result.dart';
import '../models/network-exceptions.dart';
import '../models/transaction-build-blob-req.dart';
import '../models/transaction-build-blob-resp.dart';

import '../models/transaction-info-resp.dart';

class ZetrixTransactionService extends BaseNodeService {
  ZetrixTransactionService(bool mainnet) : super(mainnet);

  Future<ApiResult<TransactionBuildBlobResp>> buildBlob(
      TransactionBuildBlobReq req) async {
    String url = '/getTransactionBlob';

    if (!Tools.validateParams(req.toJson())) {
      return const ApiResult.failure(error: BadRequest());
    }

    List<Object> objs =
        TransactionBuilder.build(req.operations!, req.sourceAddress!);

    BuildBlob<CreateAccount> reqData = BuildBlob<CreateAccount>();
    reqData.operations = objs.map((e) => e as CreateAccount).toList();
    reqData.sourceAddress = req.sourceAddress;
    reqData.feeLimit = req.feeLimit;
    reqData.gasPrice = req.gasPrice;
    reqData.nonce = req.nonce;

    try {
      final response = await dio.post(url, data: reqData);

      TransactionBuildBlobResp transactionBuildBlobResp =
          TransactionBuildBlobResp.fromJson(response.data);

      if (transactionBuildBlobResp.errorCode == SdkError.success.code) {
        return ApiResult.success(data: transactionBuildBlobResp);
      } else {
        return ApiResult.failure(
            error: DefaultError(transactionBuildBlobResp.errorDesc ??
                SdkError.resultNotFound.toString()));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<TransactionInfoResp>> getTransactionHistory(
      String hash) async {
    String url = '/getTransactionHistory';

    if (Tools.isEmptyString(hash)) {
      return const ApiResult.failure(error: BadRequest());
    }

    try {
      final response = await dio.get(url, queryParameters: {'hash': hash});

      TransactionInfoResp transactionInfoResp =
          TransactionInfoResp.fromJson(response.data);

      if (transactionInfoResp.errorCode == SdkError.success.code) {
        return ApiResult.success(data: transactionInfoResp);
      } else if (transactionInfoResp.errorCode ==
          SdkError.queryResultNotExist.code) {
        return ApiResult.failure(
            error: DefaultError(transactionInfoResp.errorDesc ??
                SdkError.queryResultNotExist.toString()));
      } else {
        return ApiResult.failure(
            error: DefaultError(transactionInfoResp.errorDesc ??
                SdkError.resultNotFound.toString()));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
