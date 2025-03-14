import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:zetrix_flutter/src/models/common/signature.dart';
import 'package:zetrix_flutter/src/models/operations/build-blob.dart';
import 'package:zetrix_flutter/src/models/sdk-result.dart';
import 'package:zetrix_flutter/src/models/network-exceptions.dart';
import 'package:zetrix_flutter/src/models/transaction/transaction-build-blob-req.dart';
import 'package:zetrix_flutter/src/models/transaction/transaction-build-blob-resp.dart';
import 'package:zetrix_flutter/src/models/transaction/transaction-info-resp.dart';
import 'package:zetrix_flutter/src/models/transaction/transaction-sign-req.dart';
import 'package:zetrix_flutter/src/models/transaction/transaction-sign-resp.dart';
import 'package:zetrix_flutter/src/models/transaction/transaction-sign-result.dart';
import 'package:zetrix_flutter/src/models/transaction/transaction-submit-blob-req.dart';
import 'package:zetrix_flutter/src/models/transaction/transaction-submit-blob-resp.dart';
import 'package:zetrix_flutter/src/models/transaction/transaction-submit-blob-result.dart';
import 'package:zetrix_flutter/src/services/base_node.service.dart';
import 'package:zetrix_flutter/src/utils/sdk-error.enum.dart';
import 'package:zetrix_flutter/src/utils/tools.dart';
import 'package:zetrix_flutter/src/utils/transaction_builder.dart';

import '../../zetrix_flutter.dart';
import '../models/chain/operation.dart';
import '../models/operations/account-activate-operation.dart';
import '../models/transaction/sign-blob-resp.dart';
import '../models/transaction/transaction-submit-blob-item-req.dart';

class ZetrixTransactionService extends BaseNodeService {
  ZetrixTransactionService(bool mainnet) : super(mainnet);

  Future<SDKResult<TransactionBuildBlobResp>> buildBlob(
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

      TransactionBuildBlobResp transactionBuildBlobResp =
          TransactionBuildBlobResp.fromJson(response.data);

      if (transactionBuildBlobResp.errorCode == SdkError.success.code) {
        return SDKResult.success(data: transactionBuildBlobResp);
      } else {
        return SDKResult.failure(
            error: DefaultError(transactionBuildBlobResp.errorDesc ??
                SdkError.resultNotFound.toString()));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return SDKResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

/*
  Future<SDKResult<TransactionBuildBlobResp>> parseBlob(
      TransactionBuildBlobReq req) async {

  }

  Future<SDKResult<TransactionBuildBlobResp>> evaluateFee(
      TransactionBuildBlobReq req) async {

  }
*/
  Future<SDKResult<TransactionSignResult>> sign(TransactionSignReq req) async {
    final encryption = Encryption();

    if (!Tools.validateParams(req.toJson())) {
      return const SDKResult.failure(error: BadRequest());
    }

    TransactionSignResult result = TransactionSignResult();
    result.signatures = [];
    for (int i = 0; i < req.privateKeys!.length; i++) {
      SignBlobResp signedBlob =
          await encryption.signBlob(req.blob, req.privateKeys![i]);
      Signature sig = Signature();
      sig.publicKey = signedBlob.publicKey;
      sig.signData = signedBlob.signBlob;
      result.signatures!.add(sig);
    }

    return SDKResult.success(data: result);
  }

  Future<SDKResult<TransactionSubmitBlobResult>> submit(
      TransactionSubmitBlobReq req) async {
    String url = '/submitTransaction';

    if (!Tools.validateParams(req.toJson())) {
      return const SDKResult.failure(error: BadRequest());
    }

    TransactionSubmitBlobItemReq reqData = TransactionSubmitBlobItemReq();
    reqData.items = [req];

    try {
      final response = await dio.post(url, data: reqData.toJson());

      print(response);

      TransactionSubmitBlobResp transactionSubmitBlobResp =
          TransactionSubmitBlobResp.fromJson(response.data);

      if (transactionSubmitBlobResp.errorCode == SdkError.success.code) {
        TransactionSubmitBlobResult result = TransactionSubmitBlobResult();
        result.hash = transactionSubmitBlobResp.result!.hash;
        return SDKResult.success(data: result);
      } else {
        return SDKResult.failure(
            error: DefaultError(transactionSubmitBlobResp.errorDesc ??
                SdkError.resultNotFound.toString()));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return SDKResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<SDKResult<TransactionInfoResp>> getInfo(String hash) async {
    String url = '/getTransactionHistory';

    if (Tools.isEmptyString(hash)) {
      return const SDKResult.failure(error: BadRequest());
    }

    try {
      final response = await dio.get(url, queryParameters: {'hash': hash});

      TransactionInfoResp transactionInfoResp =
          TransactionInfoResp.fromJson(response.data);

      if (transactionInfoResp.errorCode == SdkError.success.code) {
        return SDKResult.success(data: transactionInfoResp);
      } else if (transactionInfoResp.errorCode ==
          SdkError.queryResultNotExist.code) {
        return SDKResult.failure(
            error: DefaultError(transactionInfoResp.errorDesc ??
                SdkError.queryResultNotExist.toString()));
      } else {
        return SDKResult.failure(
            error: DefaultError(transactionInfoResp.errorDesc ??
                SdkError.resultNotFound.toString()));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return SDKResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
