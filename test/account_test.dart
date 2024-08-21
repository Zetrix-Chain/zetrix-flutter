import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zetrix_flutter/src/models/account-balance-result.dart';
import 'package:zetrix_flutter/src/models/account-info-result.dart';
import 'package:zetrix_flutter/src/models/account-nonce-result.dart';
import 'package:zetrix_flutter/src/models/account-valid-result.dart';
import 'package:zetrix_flutter/src/models/sdk-result.dart';
import 'package:zetrix_flutter/src/models/create-account-result.dart';
import 'package:zetrix_flutter/src/models/network-exceptions.dart';
import 'package:zetrix_flutter/src/services/account.service.dart';

void main() {
  final account = ZetrixAccountService(false);

  var userAccount = {"address": "", "pubKey": "", "privKey": ""};

  test('Create account', () async {
    CreateAccountResult? finalResp;
    SDKResult<CreateAccountResult> resp = await account.createAccount();

    resp.when(success: (CreateAccountResult? obj) {
      if (obj != null) {
        finalResp = obj;
        print(finalResp!.toJson().toString());
        userAccount["address"] = finalResp!.address!;
        userAccount["pubKey"] = finalResp!.publicKey!;
        userAccount["privKey"] = finalResp!.privateKey!;
      }
    }, failure: (NetworkExceptions? error) {
      finalResp = null;
    });

    expect(finalResp, isNotNull);
  });

  test('Check account info - account not activated', () async {
    AccountInfo? finalResp;
    SDKResult<AccountInfo> resp =
        await account.getAccountInfo(userAccount["address"]!);
    resp.when(success: (AccountInfo? obj) {
      if (obj != null) {
        finalResp = obj;
        if (kDebugMode) {
          print(finalResp!.toJson().toString());
        }
      }
    }, failure: (NetworkExceptions? error) {
      finalResp = null;
    });

    expect(finalResp, isNull);
  });

  test('Check account info - account activated', () async {
    AccountInfo? finalResp;
    SDKResult<AccountInfo> resp =
        await account.getAccountInfo("ZTX3eCbfDcZjf8XBCF6ouStyhRZDT9QxVC7Vw");
    resp.when(success: (AccountInfo? obj) {
      if (obj != null) {
        finalResp = obj;
        if (kDebugMode) {
          print(finalResp!.toJson().toString());
        }
      }
    }, failure: (NetworkExceptions? error) {
      finalResp = null;
    });

    expect(finalResp, isNotNull);
  });

  test('Get balance', () async {
    AccountBalanceResult? finalResp;
    SDKResult<AccountBalanceResult> resp =
        await account.getBalance("ZTX3eCbfDcZjf8XBCF6ouStyhRZDT9QxVC7Vw");
    resp.when(success: (AccountBalanceResult? obj) {
      if (obj != null) {
        finalResp = obj;
        if (kDebugMode) {
          print(finalResp!.toJson().toString());
        }
      }
    }, failure: (NetworkExceptions? error) {
      finalResp = null;
    });

    expect(finalResp, isNotNull);
  });

  test('Check account isValid', () async {
    AccountValidResult? finalResp;
    SDKResult<AccountValidResult> resp =
        await account.validateAccount("ZTX3eCbfDcZjf8XBCF6ouStyhRZDT9QxVC7Vw");
    resp.when(success: (AccountValidResult? obj) {
      if (obj != null) {
        finalResp = obj;
        if (kDebugMode) {
          print(finalResp!.toJson().toString());
        }
      }
    }, failure: (NetworkExceptions? error) {
      finalResp = null;
    });

    expect(finalResp, isNotNull);
  });

  test('Get account nonce', () async {
    AccountNonceResult? finalResp;
    SDKResult<AccountNonceResult> resp =
        await account.getNonce("ZTX3eCbfDcZjf8XBCF6ouStyhRZDT9QxVC7Vw");
    resp.when(success: (AccountNonceResult? obj) {
      if (obj != null) {
        finalResp = obj;
        if (kDebugMode) {
          print(finalResp!.toJson().toString());
        }
      }
    }, failure: (NetworkExceptions? error) {
      finalResp = null;
    });

    expect(finalResp, isNotNull);
  });
}
