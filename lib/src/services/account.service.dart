import 'package:flutter/foundation.dart';
import 'package:zetrix_flutter/src/models/account/account-balance.dart';
import 'package:zetrix_flutter/src/models/account/account-info.dart';
import 'package:zetrix_flutter/src/models/account/account-valid.dart';
import 'package:zetrix_flutter/src/models/account/create-account.dart';
import 'package:zetrix_flutter/src/models/base-response.dart';
import 'package:zetrix_flutter/src/services/base_node.service.dart';
import 'package:zetrix_flutter/src/models/account/account-nonce.dart';
import 'package:zetrix_flutter/src/utils/encryption.dart';

import 'package:zetrix_flutter/src/models/sdk-result.dart';
import 'package:zetrix_flutter/src/models/sdk-exceptions.dart';
import 'package:zetrix_flutter/src/utils/sdk-error.enum.dart';
import 'package:zetrix_flutter/src/utils/tools.dart';

class ZetrixAccountService extends BaseNodeService {
  ZetrixAccountService(super.mainnet);

  Future<ZetrixSDKResult<CreateAccount>> createAccount() async {
    try {
      Encryption encryption = Encryption();
      CreateAccount keyPair = await encryption.generateKeyPair();
      return ZetrixSDKResult.success(data: keyPair);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return ZetrixSDKResult.failure(
          error: ZetrixSDKExceptions.getDioException(e));
    }
  }

  Future<ZetrixSDKResult<AccountInfo>> getAccountInfo(String address) async {
    String url = '/getAccount';

    if (Tools.isEmptyString(address)) {
      return const ZetrixSDKResult.failure(error: BadRequest());
    }

    try {
      final response =
          await dio.get(url, queryParameters: {"address": address});
      if (kDebugMode) {
        print(response);
      }

      BaseResponse<AccountInfo> resp = BaseResponse<AccountInfo>.fromJson(
        response.data,
        (json) => AccountInfo.fromJson(json as Map<String, dynamic>),
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

  Future<ZetrixSDKResult<AccountValid>> validateAccount(String address) async {
    if (Tools.isEmptyString(address)) {
      return const ZetrixSDKResult.failure(error: BadRequest());
    }

    AccountValid resp = AccountValid();

    Encryption encryption = Encryption();

    resp.isValid = encryption.checkAddress(address);

    return ZetrixSDKResult.success(data: resp);
  }

  Future<ZetrixSDKResult<AccountBalance>> getBalance(String address) async {
    ZetrixSDKResult<AccountInfo> accountResp = await getAccountInfo(address);
    AccountBalance resp = AccountBalance();
    int bal = 0;

    accountResp.when(success: (AccountInfo? obj) {
      if (obj != null && obj.balance != null) {
        bal = obj.balance!;
      }
    }, failure: (ZetrixSDKExceptions? error) {
      bal = 0;
    });

    resp.balance = bal;

    return ZetrixSDKResult.success(data: resp);
  }

  Future<ZetrixSDKResult<AccountNonce>> getNonce(String address) async {
    ZetrixSDKResult<AccountInfo> accountResp = await getAccountInfo(address);
    AccountNonce resp = AccountNonce();
    int nonce = 0;

    accountResp.when(success: (AccountInfo? obj) {
      if (obj != null && obj.nonce != null) {
        nonce = obj.nonce!;
      }
    }, failure: (ZetrixSDKExceptions? error) {
      nonce = 0;
    });

    resp.nonce = nonce;

    return ZetrixSDKResult.success(data: resp);
  }

  getMetadata() {}

  isActivated() {}

  getAssets() {}
}
