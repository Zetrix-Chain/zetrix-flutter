import 'package:flutter/foundation.dart';
import 'package:zetrix_flutter/src/models/account-balance-result.dart';
import 'package:zetrix_flutter/src/models/account-info-resp.dart';
import 'package:zetrix_flutter/src/models/account-valid-result.dart';
import 'package:zetrix_flutter/src/models/create-account-result.dart';
import 'package:zetrix_flutter/src/services/base_node.service.dart';
import 'package:zetrix_flutter/zetrix_flutter.dart';

import '../models/account-info-result.dart';
import '../models/account-nonce-result.dart';
import '../models/api-result.dart';
import '../models/network-exceptions.dart';
import '../utils/sdk-error.enum.dart';
import '../utils/tools.dart';

class ZetrixAccountService extends BaseNodeService {
  ZetrixAccountService(bool mainnet) : super(mainnet);

  Future<ApiResult<CreateAccountResult>> createAccount() async {
    try {
      Encryption encryption = Encryption();
      CreateAccountResult keyPair = await encryption.generateKeyPair();
      return ApiResult.success(data: keyPair);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<AccountInfo>> getAccountInfo(String address) async {
    String url = '/getAccount';

    if (Tools.isEmptyString(address)) {
      return const ApiResult.failure(error: BadRequest());
    }

    try {
      final response =
          await dio.get(url, queryParameters: {"address": address});
      if (kDebugMode) {
        print(response);
      }

      AccountInfoResp accountInfoResp = AccountInfoResp.fromJson(response.data);

      if (accountInfoResp.errorCode == SdkError.success.code) {
        return ApiResult.success(data: accountInfoResp.result);
      } else {
        return ApiResult.failure(
            error: DefaultError(accountInfoResp.errorDesc ??
                SdkError.resultNotFound.toString()));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<AccountValidResult>> validateAccount(String address) async {
    if (Tools.isEmptyString(address)) {
      return const ApiResult.failure(error: BadRequest());
    }

    AccountValidResult resp = AccountValidResult();

    Encryption encryption = Encryption();

    resp.isValid = encryption.checkAddress(address);

    return ApiResult.success(data: resp);
  }

  Future<ApiResult<AccountBalanceResult>> getBalance(String address) async {
    ApiResult<AccountInfo> accountResp = await getAccountInfo(address);
    AccountBalanceResult resp = AccountBalanceResult();
    int bal = 0;

    accountResp.when(success: (AccountInfo? obj) {
      if (obj != null && obj.balance != null) {
        bal = obj.balance!;
      }
    }, failure: (NetworkExceptions? error) {
      bal = 0;
    });

    resp.balance = bal;

    return ApiResult.success(data: resp);
  }

  Future<ApiResult<AccountNonceResult>> getNonce(String address) async {
    ApiResult<AccountInfo> accountResp = await getAccountInfo(address);
    AccountNonceResult resp = AccountNonceResult();
    int nonce = 1;

    accountResp.when(success: (AccountInfo? obj) {
      if (obj != null && obj.nonce != null) {
        nonce = obj.nonce!;
      }
    }, failure: (NetworkExceptions? error) {
      nonce = 1;
    });

    resp.nonce = nonce;

    return ApiResult.success(data: resp);
  }

  getMetadata() {}

  isActivated() {}

  getAssets() {}
}
