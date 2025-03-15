import 'package:flutter/foundation.dart';
import 'package:zetrix_flutter/src/models/base-response.dart';
import 'package:zetrix_flutter/src/models/common/signature.dart';
import 'package:zetrix_flutter/src/models/operations/build-blob.dart';
import 'package:zetrix_flutter/src/models/sdk-result.dart';
import 'package:zetrix_flutter/src/models/sdk-exceptions.dart';
import 'package:zetrix_flutter/src/models/transaction/req/transaction-build-blob-req.dart';
import 'package:zetrix_flutter/src/models/transaction/req/transaction-sign-req.dart';
import 'package:zetrix_flutter/src/models/transaction/resp/transaction-sign-result.dart';
import 'package:zetrix_flutter/src/models/transaction/req/transaction-submit-blob-req.dart';
import 'package:zetrix_flutter/src/models/transaction/resp/transaction-submit-blob-result.dart';
import 'package:zetrix_flutter/src/models/transaction/req/transaction-submit-blob-item-req.dart';
import 'package:zetrix_flutter/src/models/transaction/resp/transaction-build-blob-result.dart';
import 'package:zetrix_flutter/src/models/transaction/resp/transaction-info-result.dart';
import 'package:zetrix_flutter/src/models/transaction/sign-blob.dart';
import 'package:zetrix_flutter/src/services/base_node.service.dart';
import 'package:zetrix_flutter/src/utils/encryption.dart';
import 'package:zetrix_flutter/src/utils/sdk-error.enum.dart';
import 'package:zetrix_flutter/src/utils/tools.dart';
import 'package:zetrix_flutter/src/utils/transaction_builder.dart';

class ZetrixTransactionService extends BaseNodeService {
  ZetrixTransactionService(super.mainnet);

  Future<ZetrixSDKResult<TransactionBuildBlobResult>> buildBlob(
      TransactionBuildBlobReq req) async {
    String url = '/getTransactionBlob';

    if (req.operations == null) {
      throw Exception("Invalid operations");
    }

    if (req.sourceAddress == null) {
      throw Exception("Invalid sourceAddress");
    }

    if (req.feeLimit == null) {
      throw Exception("Invalid feeLimit");
    }

    if (req.gasPrice == null) {
      throw Exception("Invalid gasPrice");
    }

    if (req.nonce == null) {
      throw Exception("Invalid nonce");
    }

    BuildBlob reqData = BuildBlob();
    reqData.operations =
        TransactionBuilder.build(req.operations!, req.sourceAddress!);
    reqData.sourceAddress = req.sourceAddress;
    reqData.feeLimit = req.feeLimit;
    reqData.gasPrice = req.gasPrice;
    reqData.nonce = req.nonce;

    try {
      final response = await dio.post(url, data: reqData.toJson());

      BaseResponse<TransactionBuildBlobResult> resp =
          BaseResponse<TransactionBuildBlobResult>.fromJson(
        response.data,
        (json) =>
            TransactionBuildBlobResult.fromJson(json as Map<String, dynamic>),
      );

      if (resp.errorCode == SdkError.success.code) {
        return ZetrixSDKResult.success(data: resp.result);
      } else {
        return ZetrixSDKResult.failure(
            error: DefaultError(
                resp.errorDesc ?? SdkError.resultNotFound.toString()));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return ZetrixSDKResult.failure(
          error: ZetrixSDKExceptions.getDioException(e));
    }
  }

/*
  Future<ZetrixSDKResult<TransactionBuildBlobResp>> parseBlob(
      TransactionBuildBlobReq req) async {

  }

  Future<ZetrixSDKResult<TransactionBuildBlobResp>> evaluateFee(
      TransactionBuildBlobReq req) async {

  }
*/
  Future<ZetrixSDKResult<TransactionSignResult>> sign(
      TransactionSignReq req) async {
    final encryption = Encryption();

    if (!Tools.validateParams(req.toJson())) {
      return const ZetrixSDKResult.failure(error: BadRequest());
    }

    TransactionSignResult result = TransactionSignResult();
    result.signatures = [];
    for (int i = 0; i < req.privateKeys!.length; i++) {
      SignBlob signedBlob =
          await encryption.signBlob(req.blob, req.privateKeys![i]);
      Signature sig = Signature();
      sig.publicKey = signedBlob.publicKey;
      sig.signData = signedBlob.signBlob;
      result.signatures!.add(sig);
    }

    return ZetrixSDKResult.success(data: result);
  }

  Future<ZetrixSDKResult<TransactionSubmitBlobResult>> submit(
      TransactionSubmitBlobReq req) async {
    String url = '/submitTransaction';

    if (!Tools.validateParams(req.toJson())) {
      return const ZetrixSDKResult.failure(error: BadRequest());
    }

    TransactionSubmitBlobItemReq reqData = TransactionSubmitBlobItemReq();
    reqData.items = [req];

    try {
      final response = await dio.post(url, data: reqData.toJson());

      print(response);

      BaseResponse<TransactionSubmitBlobResult> resp =
          BaseResponse<TransactionSubmitBlobResult>.fromJson(
        response.data,
        (json) =>
            TransactionSubmitBlobResult.fromJson(json as Map<String, dynamic>),
      );

      if (resp.errorCode == SdkError.success.code) {
        TransactionSubmitBlobResult result = TransactionSubmitBlobResult();
        result.hash = resp.result!.hash;
        return ZetrixSDKResult.success(data: result);
      } else {
        return ZetrixSDKResult.failure(
            error: DefaultError(
                resp.errorDesc ?? SdkError.resultNotFound.toString()));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return ZetrixSDKResult.failure(
          error: ZetrixSDKExceptions.getDioException(e));
    }
  }

  Future<ZetrixSDKResult<TransactionInfoResult>> getInfo(String hash) async {
    String url = '/getTransactionHistory';

    if (Tools.isEmptyString(hash)) {
      return const ZetrixSDKResult.failure(error: BadRequest());
    }

    try {
      final response = await dio.get(url, queryParameters: {'hash': hash});

      BaseResponse<TransactionInfoResult> resp =
          BaseResponse<TransactionInfoResult>.fromJson(
        response.data,
        (json) => TransactionInfoResult.fromJson(json as Map<String, dynamic>),
      );

      if (resp.errorCode == SdkError.success.code) {
        return ZetrixSDKResult.success(data: resp.result);
      } else if (resp.errorCode == SdkError.queryResultNotExist.code) {
        return ZetrixSDKResult.failure(
            error: DefaultError(
                resp.errorDesc ?? SdkError.queryResultNotExist.toString()));
      } else {
        return ZetrixSDKResult.failure(
            error: DefaultError(
                resp.errorDesc ?? SdkError.resultNotFound.toString()));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return ZetrixSDKResult.failure(
          error: ZetrixSDKExceptions.getDioException(e));
    }
  }
}
