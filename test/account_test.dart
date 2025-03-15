import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zetrix_flutter/zetrix_flutter.dart';

void main() {
  final account = ZetrixAccountService(false);

  var userAccount = {"address": "", "pubKey": "", "privKey": ""};

  test('Create account', () async {
    CreateAccount? finalResp;
    ZetrixSDKResult<CreateAccount> resp = await account.createAccount();

    resp.when(success: (CreateAccount? obj) {
      if (obj != null) {
        finalResp = obj;
        print(finalResp!.toJson().toString());
        userAccount["address"] = finalResp!.address!;
        userAccount["pubKey"] = finalResp!.publicKey!;
        userAccount["privKey"] = finalResp!.privateKey!;
      }
    }, failure: (ZetrixSDKExceptions? error) {
      finalResp = null;
    });

    expect(finalResp, isNotNull);
  });

  test('Check account info - account not activated', () async {
    AccountInfo? finalResp;
    ZetrixSDKResult<AccountInfo> resp =
        await account.getAccountInfo(userAccount["address"]!);
    resp.when(success: (AccountInfo? obj) {
      if (obj != null) {
        finalResp = obj;
        if (kDebugMode) {
          print(finalResp!.toJson().toString());
        }
      }
    }, failure: (ZetrixSDKExceptions? error) {
      finalResp = null;
    });

    expect(finalResp, isNull);
  });

  test('Check account info - account activated', () async {
    AccountInfo? finalResp;
    ZetrixSDKResult<AccountInfo> resp =
        await account.getAccountInfo("ZTX3eCbfDcZjf8XBCF6ouStyhRZDT9QxVC7Vw");
    resp.when(success: (AccountInfo? obj) {
      if (obj != null) {
        finalResp = obj;
        if (kDebugMode) {
          print(finalResp!.toJson().toString());
        }
      }
    }, failure: (ZetrixSDKExceptions? error) {
      finalResp = null;
    });

    expect(finalResp, isNotNull);
  });

  test('Get balance', () async {
    AccountBalance? finalResp;
    ZetrixSDKResult<AccountBalance> resp =
        await account.getBalance("ZTX3eCbfDcZjf8XBCF6ouStyhRZDT9QxVC7Vw");
    resp.when(success: (AccountBalance? obj) {
      if (obj != null) {
        finalResp = obj;
        if (kDebugMode) {
          print(finalResp!.toJson().toString());
        }
      }
    }, failure: (ZetrixSDKExceptions? error) {
      finalResp = null;
    });

    expect(finalResp, isNotNull);
  });

  test('Check account isValid', () async {
    AccountValid? finalResp;
    ZetrixSDKResult<AccountValid> resp =
        await account.validateAccount("ZTX3eCbfDcZjf8XBCF6ouStyhRZDT9QxVC7Vw");
    resp.when(success: (AccountValid? obj) {
      if (obj != null) {
        finalResp = obj;
        if (kDebugMode) {
          print(finalResp!.toJson().toString());
        }
      }
    }, failure: (ZetrixSDKExceptions? error) {
      finalResp = null;
    });

    expect(finalResp, isNotNull);
  });

  test('Get account nonce', () async {
    AccountNonce? finalResp;
    ZetrixSDKResult<AccountNonce> resp =
        await account.getNonce("ZTX3eCbfDcZjf8XBCF6ouStyhRZDT9QxVC7Vw");
    resp.when(success: (AccountNonce? obj) {
      if (obj != null) {
        finalResp = obj;
        if (kDebugMode) {
          print(finalResp!.toJson().toString());
        }
      }
    }, failure: (ZetrixSDKExceptions? error) {
      finalResp = null;
    });

    expect(finalResp, isNotNull);
  });
}
