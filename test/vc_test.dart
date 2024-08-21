import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zetrix_flutter/src/models/sdk-result.dart';
import 'package:zetrix_flutter/src/models/network-exceptions.dart';
import 'package:zetrix_flutter/src/models/sign-blob-resp.dart';
import 'package:zetrix_flutter/src/models/sign-message-resp.dart';
import 'package:zetrix_flutter/src/models/vc/apply/attribute-key-value.dart';
import 'package:zetrix_flutter/src/models/vc/apply/vc-apply-req.dart';
import 'package:zetrix_flutter/src/models/vc/apply/vc-apply-result.dart';
import 'package:zetrix_flutter/src/models/vc/apply/vc-attribute-content.dart';
import 'package:zetrix_flutter/src/models/vc/issue/vc-audit-blob-result.dart';
import 'package:zetrix_flutter/src/models/vc/issue/vc-audit-submit-req.dart';
import 'package:zetrix_flutter/src/models/vc/issue/vc-audit-submit-result.dart';
import 'package:zetrix_flutter/src/models/vc/auth/vc-register-blob-req.dart';
import 'package:zetrix_flutter/src/models/vc/auth/vc-register-blob-resp.dart';
import 'package:zetrix_flutter/src/models/vc/auth/vc-register-submit-req.dart';
import 'package:zetrix_flutter/src/models/vc/auth/vc-register-submit-resp.dart';
import 'package:zetrix_flutter/src/models/vc/download/vc-download-req.dart';
import 'package:zetrix_flutter/src/models/vc/download/vc-download-result.dart';
import 'package:zetrix_flutter/src/models/vc/info/vc-info-req.dart';
import 'package:zetrix_flutter/src/models/vc/info/vc-info-resp.dart';
import 'package:zetrix_flutter/src/models/vc/qr/vc-generateqr-blob-req.dart';
import 'package:zetrix_flutter/src/models/vc/qr/vc-generateqr-blob-result.dart';
import 'package:zetrix_flutter/src/models/vc/qr/vc-generateqr-req.dart';
import 'package:zetrix_flutter/src/models/vc/vc-finalize-req.dart';
import 'package:zetrix_flutter/src/models/vc/vc-finalize-resp.dart';
import 'package:zetrix_flutter/src/models/vc/verify/vc-verification-result.dart';
import 'package:zetrix_flutter/src/services/vc.service.dart';
import 'package:zetrix_flutter/src/utils/sdk-error.enum.dart';
import 'package:zetrix_flutter/src/utils/vp_jws.dart';
import 'package:zetrix_flutter/zetrix_flutter.dart';

void main() {
  final service = ZetrixVcService(false);
  final encryption = Encryption();

  var holder = {
    "address": "<ADDRESS>",
    "privKey": "<PRIV_KEY>",
    "token": "",
    "blob": "",
    "blodId": "",
    "pubKey": ""
  };

  var apply = {"applyNo": "", "payload": "", "payloadId": "", "bcTxBlob": ""};

  var vc = {
    "vcId": "",
    "jws": "",
    "vcContent": "",
    "issuerBid": "",
    "issuerAddress": "",
    "isDownload": null
  };

  var verify = {"blobId": "", "blob": "", "qrCode": ""};

  var issuer = {
    "address": "<ADDRESS>",
    "privKey": "<PRIV_KEY>",
    "token": "",
    "blob": "",
    "blodId": "",
    "pubKey": ""
  };

  test('get registration blob - holder', () async {
    VcRegisterBlobResp? finalResp;

    VcRegisterBlobReq req = VcRegisterBlobReq();
    req.address = holder["address"];

    SDKResult<VcRegisterBlobResp> resp = await service.getRegisterBlob(req);

    resp.when(success: (VcRegisterBlobResp? obj) {
      if (obj != null) {
        finalResp = obj;
        holder["blob"] = finalResp!.blob!;
        holder["blobId"] = finalResp!.blobId!;
      }
    }, failure: (NetworkExceptions? error) {
      finalResp = null;
    });

    expect(finalResp, isNotNull);
    expect(finalResp!.blobId, isNotNull);
    expect(finalResp!.blob, isNotNull);
  });

  test('get token - holder', () async {
    VcRegisterSubmitResp? finalResp;

    SignBlobResp signResp =
        await encryption.signBlob(holder["blob"], holder["privKey"]);

    VcRegisterSubmitReq req = VcRegisterSubmitReq();
    req.blobId = holder["blobId"];
    req.blobSign = signResp.signBlob;
    req.publicKey = signResp.publicKey;
    req.address = holder["address"];

    holder["pubKey"] = signResp.publicKey!;

    SDKResult<VcRegisterSubmitResp> submitResp =
        await service.getRegisterToken(req);
    await submitResp.when(success: (VcRegisterSubmitResp? obj) async {
      if (obj != null) {
        finalResp = obj;
        holder["token"] = finalResp!.token!;
      }
    }, failure: (NetworkExceptions? error) {
      finalResp = null;
    });

    expect(finalResp, isNotNull);
    expect(finalResp!.token, isNotNull);
  });

  test('get registration blob - issuer', () async {
    VcRegisterBlobResp? finalResp;

    VcRegisterBlobReq req = VcRegisterBlobReq();
    req.address = issuer["address"];

    SDKResult<VcRegisterBlobResp> resp = await service.getRegisterBlob(req);

    resp.when(success: (VcRegisterBlobResp? obj) {
      if (obj != null) {
        finalResp = obj;
        issuer["blob"] = finalResp!.blob!;
        issuer["blobId"] = finalResp!.blobId!;
      }
    }, failure: (NetworkExceptions? error) {
      finalResp = null;
    });

    expect(finalResp, isNotNull);
    expect(finalResp!.blobId, isNotNull);
    expect(finalResp!.blob, isNotNull);
  });

  test('get token', () async {
    VcRegisterSubmitResp? finalResp;

    SignBlobResp signResp =
        await encryption.signBlob(issuer["blob"], issuer["privKey"]);

    VcRegisterSubmitReq req = VcRegisterSubmitReq();
    req.blobId = issuer["blobId"];
    req.blobSign = signResp.signBlob;
    req.publicKey = signResp.publicKey;
    req.address = issuer["address"];

    issuer["pubKey"] = signResp.publicKey!;

    SDKResult<VcRegisterSubmitResp> submitResp =
        await service.getRegisterToken(req);
    await submitResp.when(success: (VcRegisterSubmitResp? obj) async {
      if (obj != null) {
        finalResp = obj;
        issuer["token"] = finalResp!.token!;
      }
    }, failure: (NetworkExceptions? error) {
      finalResp = null;
    });

    expect(finalResp, isNotNull);
    expect(finalResp!.token, isNotNull);
  });

  test('get token - error signature', () async {
    VcRegisterSubmitResp? finalResp;

    SignMessageResp signResp =
        await encryption.signMessage(holder["blob"], holder["privKey"]);

    VcRegisterSubmitReq req = VcRegisterSubmitReq();
    req.blobId = holder["blobId"];
    req.blobSign = signResp.signData;
    req.publicKey = signResp.publicKey;
    req.address = holder["address"];

    SDKResult<VcRegisterSubmitResp> submitResp =
        await service.getRegisterToken(req);
    await submitResp.when(success: (VcRegisterSubmitResp? obj) async {
      if (obj != null) {
        finalResp = obj;
      }
    }, failure: (NetworkExceptions? e) {
      finalResp = null;
      var errMsg = e as DefaultError;
      expect(errMsg.error, "Transaction signature error");
    });

    expect(finalResp, isNull);
  });

  test('get token - error invalid param', () async {
    VcRegisterSubmitResp? finalResp;

    SignBlobResp signResp =
        await encryption.signBlob(holder["blob"], holder["privKey"]);

    VcRegisterSubmitReq req = VcRegisterSubmitReq();
    req.blobId = holder["blobId"];
    req.blobSign = signResp.signBlob;
    req.publicKey = signResp.publicKey;

    SDKResult<VcRegisterSubmitResp> submitResp =
        await service.getRegisterToken(req);
    await submitResp.when(success: (VcRegisterSubmitResp? obj) async {
      if (obj != null) {
        finalResp = obj;
      }
    }, failure: (NetworkExceptions? e) {
      finalResp = null;
      var errMsg = e as DefaultError;
      expect(errMsg.error, SdkError.invalidParameter.toString());
    });

    expect(finalResp, isNull);
  });

  test('vc apply', () async {
    VcApplyResult? finalResp;

    Random random = Random();
    int randomNumber = random.nextInt(10000);

    List<AttributeKeyValue> attributes = [
      AttributeKeyValue(key: "holder", value: holder["address"]),
      AttributeKeyValue(key: "effectiveDate", value: "2023/09/23"),
      AttributeKeyValue(key: "expirationDate", value: "2123/09/23"),
      AttributeKeyValue(
          key: "certificateNo",
          value: "cert_serial_no_" + randomNumber.toString()),
      AttributeKeyValue(key: "k_1", value: "cuba 434"),
      AttributeKeyValue(key: "k_2", value: "cuba 234"),
    ];

    VcAttributeContent content = VcAttributeContent();
    content.attributes = attributes;

    VcApplyReq req = VcApplyReq();
    req.content = content;
    req.templateId = "ZTX3JdX5Mi6wsByrPoXvTZXwdaEuKfbtk3Lux";
    req.publicKey = holder["pubKey"];

    SDKResult<VcApplyResult> resp =
        await service.applyVc(holder["token"]!, req);

    resp.when(success: (VcApplyResult? obj) {
      if (obj != null) {
        finalResp = obj;
        if (kDebugMode) {
          print(finalResp?.toJson().toString());
        }
        apply['applyNo'] = finalResp!.applyNo!;
      }
    }, failure: (NetworkExceptions? error) {
      finalResp = null;
    });

    expect(finalResp, isNotNull);
  });

  test('vc issue blob', () async {
    VcAuditBlobResult? finalResp;

    SDKResult<VcAuditBlobResult> resp =
        await service.issueVcBlob(issuer["token"]!, apply['applyNo']!);

    resp.when(success: (VcAuditBlobResult? obj) {
      if (obj != null) {
        finalResp = obj;
        if (kDebugMode) {
          print(finalResp?.toJson().toString());
        }
        apply["payload"] = finalResp!.payload!;
        apply["payloadId"] = finalResp!.payloadId!;
        apply["bcTxBlob"] = finalResp!.bcTxBlob!;
      }
    }, failure: (NetworkExceptions? error) {
      finalResp = null;
    });

    expect(finalResp, isNotNull);
  });

  test('vc issue submit', () async {
    VcAuditSubmitResult? finalResp;

    SignBlobResp signBcTxBlob =
        await encryption.signBlob(apply["bcTxBlob"], issuer["privKey"]);

    SignMessageResp signPayload =
        await encryption.signMessage(apply["payload"], issuer["privKey"]);

    VcAuditSubmitReq req = VcAuditSubmitReq();
    req.payloadId = apply["payloadId"];
    req.signBcTxBlob = signBcTxBlob.signBlob;
    req.signPayload = signPayload.signData;
    req.publicKey = signPayload.publicKey;
    req.border = 0;

    SDKResult<VcAuditSubmitResult> resp =
        await service.issueVcSubmit(issuer["token"]!, req);

    resp.when(success: (VcAuditSubmitResult? obj) {
      if (obj != null) {
        finalResp = obj;
        if (kDebugMode) {
          print(finalResp?.toJson().toString());
        }
        vc["vcId"] = finalResp!.did!;
      }
    }, failure: (NetworkExceptions? error) {
      finalResp = null;
    });

    expect(finalResp, isNotNull);
  });

  test('vc info list', () async {
    VcInfoResp? finalResp;

    VcInfoReq req = VcInfoReq();
    req.userAddress = holder["address"];
    req.pageStart = 1;
    req.pageSize = 10;
    req.status = 0;

    SDKResult<VcInfoResp> resp = await service.getVcList(holder["token"]!, req);

    resp.when(success: (VcInfoResp? obj) {
      if (obj != null) {
        finalResp = obj;
        if (kDebugMode) {
          print(finalResp?.toJson().toString());
          print(finalResp!.rows!.first.toJson().toString());
        }
      }
    }, failure: (NetworkExceptions? error) {
      finalResp = null;
    });

    expect(finalResp, isNotNull);
  });

  test('vc download', () async {
    VcDownloadResult? finalResp;

    VcDownloadReq req = VcDownloadReq();
    req.userAddress = holder["address"];
    req.credentialId = vc["vcId"];

    SDKResult<VcDownloadResult> resp =
        await service.downloadVc(holder["token"]!, req);

    resp.when(success: (VcDownloadResult? obj) {
      if (obj != null) {
        finalResp = obj;
        if (kDebugMode) {
          print(finalResp?.toJson().toString());
        }
        vc['jws'] = finalResp!.jws;
        vc['vcContent'] = finalResp!.vc;
      }
    }, failure: (NetworkExceptions? error) {
      finalResp = null;
    });

    expect(finalResp, isNotNull);
  });

  test('vc apply for rejection', () async {
    VcApplyResult? finalResp;

    Random random = Random();
    int randomNumber = random.nextInt(10000);

    List<AttributeKeyValue> attributes = [
      AttributeKeyValue(key: "holder", value: holder["address"]),
      AttributeKeyValue(key: "effectiveDate", value: "2023/09/23"),
      AttributeKeyValue(key: "expirationDate", value: "2123/09/23"),
      AttributeKeyValue(
          key: "certificateNo",
          value: "cert_serial_no_" + randomNumber.toString()),
      AttributeKeyValue(key: "k_1", value: "cuba 434"),
      AttributeKeyValue(key: "k_2", value: "cuba 234"),
    ];

    VcAttributeContent content = VcAttributeContent();
    content.attributes = attributes;

    VcApplyReq req = VcApplyReq();
    req.content = content;
    req.templateId = "ZTX3JdX5Mi6wsByrPoXvTZXwdaEuKfbtk3Lux";
    req.publicKey = holder["pubKey"];

    SDKResult<VcApplyResult> resp =
        await service.applyVc(holder["token"]!, req);

    resp.when(success: (VcApplyResult? obj) {
      if (obj != null) {
        finalResp = obj;
        if (kDebugMode) {
          print(finalResp?.toJson().toString());
        }
        apply['applyNo'] = finalResp!.applyNo!;
      }
    }, failure: (NetworkExceptions? error) {
      finalResp = null;
    });

    expect(finalResp, isNotNull);
  });

  test('vc reject', () async {
    bool? finalResp;

    SDKResult<bool> resp = await service.rejectVc(
        issuer["token"]!, issuer['address']!, apply['applyNo']!);

    resp.when(success: (bool? obj) {
      if (obj != null) {
        finalResp = obj;
      }
    }, failure: (NetworkExceptions? error) {
      finalResp = null;
    });

    expect(finalResp, true);
  });

  test('vc qr code generation blob', () async {
    VcGenerateQrBlobResult? finalResp;

    var contentAssert = {"k_2": "cuba 234"};

    VcGenerateQrBlobReq req = VcGenerateQrBlobReq();
    req.vcId = vc['vcId'];
    req.contentAssert = json.encode(contentAssert);
    req.jws = vc['jws'];

    SDKResult<VcGenerateQrBlobResult> resp =
        await service.generateQrBlob(holder["token"]!, req);

    resp.when(success: (VcGenerateQrBlobResult? obj) {
      if (obj != null) {
        finalResp = obj;
        if (kDebugMode) {
          print(finalResp?.toJson().toString());
        }
        verify["blob"] = finalResp!.blob!;
        verify["blobId"] = finalResp!.blobId!;
      }
    }, failure: (NetworkExceptions? error) {
      finalResp = null;
    });

    expect(finalResp, isNotNull);
  });

  test('vc qr code generation submit', () async {
    String qrCode = "";

    SignBlobResp sign =
        await encryption.signBlob(verify["blob"], holder["privKey"]);

    VcGenerateQrReq req = VcGenerateQrReq();
    req.blobId = verify["blobId"];
    req.signBlob = sign.signBlob;
    req.publicKey = sign.publicKey;
    req.userAddress = "";

    SDKResult<String> resp =
        await service.generateQrSubmit(holder["token"]!, req);

    resp.when(success: (String? obj) {
      if (obj != null) {
        qrCode = obj;
        if (kDebugMode) {
          print(qrCode);
        }
        verify["qrCode"] = qrCode;
      }
    }, failure: (NetworkExceptions? error) {
      qrCode = "";
    });

    expect(qrCode, isNotEmpty);
  });

  test('vc verify using qrcode', () async {
    VcVerificationResult? finalResp;

    SDKResult<VcVerificationResult> resp =
        await service.verifyQrCode(verify['qrCode']!);

    resp.when(success: (VcVerificationResult? obj) {
      if (obj != null) {
        finalResp = obj;
        if (kDebugMode) {
          print(finalResp?.toJson().toString());
        }
      }
    }, failure: (NetworkExceptions? error) {
      finalResp = null;
    });

    expect(finalResp, isNotNull);
  });

  test('sign vc jws', () async {
    final VpJws vcJws = VpJws();

    VcFinalizeReq req = VcFinalizeReq();
    req.vc =
        "{\"@context\":[\"https://www.w3.org/2018/credentials/v1\"],\"credentialSubject\":{\"Certificate No\":{\"hash\":\"f266735655ce4103c9f901ff7b3d1435af249d947ba2b1edd918c7b944504bbb\",\"salt\":\"2118467830687980\",\"value\":\"Cert-test-01\"},\"Effective date\":{\"hash\":\"947e0a061bebc474e33f6cf387ddc6ba194a3e4c127b5a0c3d9fcb5c61baf55f\",\"salt\":\"9078012523674043\",\"value\":\"2023/02/13\"},\"Expiry Date\":{\"hash\":\"22ea21a4133c166e9bd5ca964f4308af8852bdddf19f81421f0237cd09cf3b93\",\"salt\":\"9570951733352126\",\"value\":\"2034/02/02\"},\"attr2\":{\"hash\":\"fa7a15c20f1a86473e22644171b354bf06815f16277e8c6c9e33fc3f1ec3f1e3\",\"salt\":\"1743465540312261\",\"value\":\"a2\"},\"id\":\"did:zid:3SDpogP2WBCv12CpVbMbqJyGrJY7L67Vrm\"},\"id\":\"did:zid:3FSpb356ut8FCzvgTw7fUJcE4mECuSAU6d\",\"issuanceDate\":\"2023-12-04T01:36:25Z\",\"issuer\":\"did:zid:3Wk4JiwggfZquiTgj4KwY6wNRFNVTrbgxe\",\"parseType\":\"sel-disclose-SM2\",\"templateId\":\"did:zid:3NfauBr7A2iQYnMH2nskxccVCh7QWHoaSy\",\"type\":[\"VerifiableCredential\"],\"validBefore\":\"2034/02/02\",\"proof\":null}";
    req.issuer = "did:zid:3Wk4JiwggfZquiTgj4KwY6wNRFNVTrbgxe";
    var signStr =
        "8f1ed50904eb88e96f7229a3d48a479e42c41cdeafd19f78841fe9bbbd6dfd0d114ce0467a88c2a363033766651ae0c2e30da61186e20901b131a7dd78a3220d";
    var needSignStr = await vcJws.signJws(req.vc ?? '');
    req.vcjws = await vcJws.buildJws(needSignStr, signStr);

    SDKResult<VcFinalizeResp> resp = await service.signedVc(req);

    VcFinalizeResp? vcGetTokenResp;

    resp.when(success: (obj) async {
      vcGetTokenResp = obj;
    }, failure: (NetworkExceptions? error) {
      print(error);
      vcGetTokenResp = null;
      if (kDebugMode) {}
    });

    expect(vcGetTokenResp, isNot(Null));
  });
}
