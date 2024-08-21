import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:zetrix_flutter/src/models/sdk-result.dart';
import 'package:zetrix_flutter/src/models/network-exceptions.dart';
import 'package:zetrix_flutter/src/models/vc/apply/vc-apply-req.dart';
import 'package:zetrix_flutter/src/models/vc/info/vc-info-req.dart';
import 'package:zetrix_flutter/src/models/vc/info/vc-info-resp.dart';
import 'package:zetrix_flutter/src/models/vc/qr/vc-generateqr-blob-req.dart';
import 'package:zetrix_flutter/src/models/vc/qr/vc-generateqr-req.dart';
import 'package:zetrix_flutter/src/models/vc/vc-finalize-req.dart';
import 'package:zetrix_flutter/src/models/vc/vc-finalize-resp.dart';
import 'package:zetrix_flutter/src/models/vp/vc-vp-proof.dart';
import 'package:zetrix_flutter/src/services/base_cred.service.dart';
import 'package:zetrix_flutter/src/utils/tools.dart';

import '../models/vc/apply/vc-apply-req-str.dart';
import '../models/vc/apply/vc-apply-result.dart';
import '../models/vc/vc-general-resp.dart';
import '../models/vc/auth/vc-register-blob-req.dart';
import '../models/vc/auth/vc-register-blob-resp.dart';
import '../models/vc/auth/vc-register-submit-req.dart';
import '../models/vc/auth/vc-register-submit-resp.dart';
import '../models/vc/download/vc-download-req.dart';
import '../models/vc/download/vc-download-result.dart';
import '../models/vc/issue/vc-audit-blob-result.dart';
import '../models/vc/issue/vc-audit-submit-req.dart';
import '../models/vc/issue/vc-audit-submit-result.dart';
import '../models/vc/qr/vc-generateqr-blob-result.dart';
import '../models/vc/vc-general-string-resp.dart';
import '../models/vc/verify/vc-verification-result.dart';
import '../utils/sdk-error.enum.dart';
import '../utils/secure_storage.dart';

class ZetrixVcService extends BaseCredService {
  ZetrixVcService(bool mainnet) : super(mainnet);
  final secureStorage = SecureStorage();

  /// Generate blob for token generation
  ///
  /// [req]: wallet address object for token generation
  ///
  /// Return blob to sign
  Future<SDKResult<VcRegisterBlobResp>> getRegisterBlob(
      VcRegisterBlobReq req) async {
    String url = basePrefix() + '/api/register/getBlob';

    if (!Tools.validateParams(req.toJson())) {
      return SDKResult.failure(
          error: DefaultError(SdkError.invalidParameter.toString()));
    }

    try {
      final response = await dio.post(url, data: req);
      if (kDebugMode) {
        print(response);
      }
      VcGeneralResp<VcRegisterBlobResp> wrappedResp =
          VcGeneralResp<VcRegisterBlobResp>.fromJson(
              response.data,
              (json) =>
                  VcRegisterBlobResp.fromJson(json as Map<String, dynamic>));

      if (wrappedResp.errorCode == SdkError.success.code) {
        return SDKResult.success(data: wrappedResp.data);
      } else {
        return SDKResult.failure(
            error: DefaultError(
                wrappedResp.message ?? SdkError.resultNotFound.toString()));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return SDKResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// Get Token
  ///
  /// [req]: object for token generation
  ///
  /// Return token
  Future<SDKResult<VcRegisterSubmitResp>> getRegisterToken(
      VcRegisterSubmitReq req) async {
    String url = basePrefix() + '/api/register/getToken';

    if (!Tools.validateParams(req.toJson())) {
      return SDKResult.failure(
          error: DefaultError(SdkError.invalidParameter.toString()));
    }

    try {
      final response = await dio.post(url, data: req);
      if (kDebugMode) {
        print(response);
      }

      VcGeneralResp<VcRegisterSubmitResp> wrappedResp =
          VcGeneralResp<VcRegisterSubmitResp>.fromJson(
              response.data,
              (json) =>
                  VcRegisterSubmitResp.fromJson(json as Map<String, dynamic>));

      if (wrappedResp.errorCode == SdkError.success.code) {
        return SDKResult.success(data: wrappedResp.data);
      } else {
        return SDKResult.failure(
            error: DefaultError(
                wrappedResp.message ?? SdkError.resultNotFound.toString()));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return SDKResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  ///  Apply VC
  ///
  ///  [accessToken]: access token for authorization
  ///  [req]: object for VC application
  ///
  /// Return VC application number
  Future<SDKResult<VcApplyResult>> applyVc(
      String accessToken, VcApplyReq req) async {
    String url = basePrefix() + '/api/vc/apply';

    if (Tools.isEmptyString(accessToken)) {
      return SDKResult.failure(
          error: DefaultError(SdkError.tokenNotExist.toString()));
    }

    if (!Tools.validateParams(req.toJson())) {
      return SDKResult.failure(
          error: DefaultError(SdkError.invalidParameter.toString()));
    }

    try {
      VcApplyReqStr reqData = VcApplyReqStr();
      reqData.content = json.encode(req.content);
      reqData.templateId = req.templateId;
      reqData.publicKey = req.publicKey;

      applyAuthToken(accessToken);
      final response = await dio.post(url, data: reqData);

      VcGeneralResp<VcApplyResult> wrappedResp =
          VcGeneralResp<VcApplyResult>.fromJson(response.data,
              (json) => VcApplyResult.fromJson(json as Map<String, dynamic>));

      if (wrappedResp.errorCode == SdkError.success.code) {
        return SDKResult.success(data: wrappedResp.data);
      } else if (wrappedResp.errorCode == SdkError.accessTokenInvalid.code) {
        return SDKResult.failure(
            error: DefaultError(
                wrappedResp.message ?? SdkError.accessTokenInvalid.toString()));
      } else {
        return SDKResult.failure(
            error: DefaultError(
                wrappedResp.message ?? SdkError.resultNotFound.toString()));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return SDKResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  ///  Get VC list by holder
  ///
  ///  [accessToken]: access token for authorization
  ///  [req]: object for VC list
  ///
  /// Return VC list
  Future<SDKResult<VcInfoResp>> getVcList(
      String accessToken, VcInfoReq req) async {
    String url = '/api/wallet/vc/simple/list';

    if (Tools.isEmptyString(accessToken)) {
      return SDKResult.failure(
          error: DefaultError(SdkError.tokenNotExist.toString()));
    }

    try {
      applyAuthToken(accessToken);
      final response = await dio.post(url, data: req);

      VcGeneralResp<VcInfoResp> wrappedResp =
          VcGeneralResp<VcInfoResp>.fromJson(response.data,
              (json) => VcInfoResp.fromJson(json as Map<String, dynamic>));

      if (wrappedResp.errorCode == SdkError.success.code) {
        return SDKResult.success(data: wrappedResp.data);
      } else if (wrappedResp.errorCode == SdkError.accessTokenInvalid.code) {
        return SDKResult.failure(
            error: DefaultError(
                wrappedResp.message ?? SdkError.accessTokenInvalid.toString()));
      } else {
        return SDKResult.failure(
            error: DefaultError(
                wrappedResp.message ?? SdkError.resultNotFound.toString()));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return SDKResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  ///  Download VC to local device
  ///
  ///  [accessToken]: access token for authorization
  ///  [req]: object for VC download
  ///
  /// Return jws, vc, issuerBid, issuerAddress
  Future<SDKResult<VcDownloadResult>> downloadVc(
      String accessToken, VcDownloadReq req) async {
    String url = '/api/wallet/vc/download';

    if (Tools.isEmptyString(accessToken)) {
      return SDKResult.failure(
          error: DefaultError(SdkError.tokenNotExist.toString()));
    }

    try {
      applyAuthToken(accessToken);
      final response = await dio.post(url, data: req);

      VcGeneralResp<VcDownloadResult> wrappedResp =
          VcGeneralResp<VcDownloadResult>.fromJson(
              response.data,
              (json) =>
                  VcDownloadResult.fromJson(json as Map<String, dynamic>));

      if (wrappedResp.errorCode == SdkError.success.code) {
        // await secureStorage.writeSecureData(
        //     wrappedResp.data!.vcId!, wrappedResp.data!.toJson().toString());

        return SDKResult.success(data: wrappedResp.data);
      } else if (wrappedResp.errorCode == SdkError.accessTokenInvalid.code) {
        return SDKResult.failure(
            error: DefaultError(
                wrappedResp.message ?? SdkError.accessTokenInvalid.toString()));
      } else {
        return SDKResult.failure(
            error: DefaultError(
                wrappedResp.message ?? SdkError.resultNotFound.toString()));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return SDKResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  ///  Create blob for VC issuance
  ///
  ///  [accessToken]: access token for authorization
  ///  [apply]: application number to issue
  ///
  /// Return payload, payloadId and bcTxBlob to sign
  Future<SDKResult<VcAuditBlobResult>> issueVcBlob(
      String accessToken, String applyNo) async {
    String url = basePrefix() + '/api/vc/audit/blob';

    try {
      var req = {"applyNo": applyNo, "reason": "VC Application", "status": 2};

      applyAuthToken(accessToken);
      final response = await dio.post(url, data: req);

      VcGeneralResp<VcAuditBlobResult> wrappedResp =
          VcGeneralResp<VcAuditBlobResult>.fromJson(
              response.data,
              (json) =>
                  VcAuditBlobResult.fromJson(json as Map<String, dynamic>));

      if (wrappedResp.errorCode == SdkError.success.code) {
        return SDKResult.success(data: wrappedResp.data);
      } else if (wrappedResp.errorCode == SdkError.accessTokenInvalid.code) {
        return SDKResult.failure(
            error: DefaultError(
                wrappedResp.message ?? SdkError.accessTokenInvalid.toString()));
      } else {
        return SDKResult.failure(
            error: DefaultError(
                wrappedResp.message ?? SdkError.resultNotFound.toString()));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return SDKResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  ///  Sign and submit blob for VC issuance
  ///
  ///  [accessToken]: access token for authorization
  ///  [req]: signed object for VC issuance
  ///
  /// Return VC ID
  Future<SDKResult<VcAuditSubmitResult>> issueVcSubmit(
      String accessToken, VcAuditSubmitReq req) async {
    String url = basePrefix() + '/api/vc/audit/submit';

    try {
      applyAuthToken(accessToken);
      final response = await dio.post(url, data: req);

      VcGeneralResp<VcAuditSubmitResult> wrappedResp =
          VcGeneralResp<VcAuditSubmitResult>.fromJson(
              response.data,
              (json) =>
                  VcAuditSubmitResult.fromJson(json as Map<String, dynamic>));

      if (wrappedResp.errorCode == SdkError.success.code) {
        return SDKResult.success(data: wrappedResp.data);
      } else if (wrappedResp.errorCode == SdkError.accessTokenInvalid.code) {
        return SDKResult.failure(
            error: DefaultError(
                wrappedResp.message ?? SdkError.accessTokenInvalid.toString()));
      } else {
        return SDKResult.failure(
            error: DefaultError(
                wrappedResp.message ?? SdkError.resultNotFound.toString()));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return SDKResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  ///  Reject VC application
  ///
  ///  [accessToken]: access token for authorization
  ///  [apply]: application number to issue
  ///
  /// Return payload, payloadId and bcTxBlob to sign
  Future<SDKResult<bool>> rejectVc(
      String accessToken, String issuerAddress, String applyNo) async {
    String url = '/api/vc/audit/disApprove';

    try {
      var req = {
        "applyNo": applyNo,
        "reason": "VC Rejection",
        "auditAddress": issuerAddress,
        "status": 3
      };

      applyAuthToken(accessToken);
      final response = await dio.post(url, data: req);

      VcGeneralResp<void> wrappedResp =
          VcGeneralResp<void>.fromJson(response.data, (json) {});

      if (wrappedResp.errorCode == SdkError.success.code) {
        return SDKResult.success(data: wrappedResp.message == "SUCCESS");
      } else if (wrappedResp.errorCode == SdkError.accessTokenInvalid.code) {
        return SDKResult.failure(
            error: DefaultError(
                wrappedResp.message ?? SdkError.accessTokenInvalid.toString()));
      } else {
        return SDKResult.failure(
            error: DefaultError(
                wrappedResp.message ?? SdkError.resultNotFound.toString()));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return SDKResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  ///  Create blob for QR generation
  ///
  ///  [accessToken]: access token for authorization
  ///  [req]: object for QR generation
  ///
  /// Return blob and blobId to sign
  @Deprecated('Use VP service')
  Future<SDKResult<VcGenerateQrBlobResult>> generateQrBlob(
      String accessToken, VcGenerateQrBlobReq req) async {
    var url = '/api/wallet/vp/qr/blob';

    try {
      applyAuthToken(accessToken);
      final response = await dio.post(url, data: req);

      VcGeneralResp<VcGenerateQrBlobResult> wrappedResp =
          VcGeneralResp<VcGenerateQrBlobResult>.fromJson(
              response.data,
              (json) => VcGenerateQrBlobResult.fromJson(
                  json as Map<String, dynamic>));

      if (wrappedResp.errorCode == SdkError.success.code) {
        return SDKResult.success(data: wrappedResp.data);
      } else if (wrappedResp.errorCode == SdkError.accessTokenInvalid.code) {
        return SDKResult.failure(
            error: DefaultError(
                wrappedResp.message ?? SdkError.accessTokenInvalid.toString()));
      } else {
        return SDKResult.failure(
            error: DefaultError(
                wrappedResp.message ?? SdkError.resultNotFound.toString()));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return SDKResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  ///  Submit blob for QR generation
  ///
  ///  [accessToken]: access token for authorization
  ///  [req]: object for QR generation
  ///
  /// Return qrCode string
  @Deprecated('Use VP service')
  Future<SDKResult<String>> generateQrSubmit(
      String accessToken, VcGenerateQrReq req) async {
    var url = '/api/wallet/vp/qr/create';

    try {
      applyAuthToken(accessToken);
      final response = await dio.post(url, data: req);

      VcGeneralStringResp wrappedResp =
          VcGeneralStringResp.fromJson(response.data);

      if (wrappedResp.errorCode == SdkError.success.code) {
        return SDKResult.success(data: wrappedResp.data);
      } else if (wrappedResp.errorCode == SdkError.accessTokenInvalid.code) {
        return SDKResult.failure(
            error: DefaultError(
                wrappedResp.message ?? SdkError.accessTokenInvalid.toString()));
      } else {
        return SDKResult.failure(
            error: DefaultError(
                wrappedResp.message ?? SdkError.resultNotFound.toString()));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return SDKResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  ///  Verify VC using QR code
  ///
  ///  [req]: object for QR generation
  ///
  /// Return qrCode string
  @Deprecated('Use VP service')
  Future<SDKResult<VcVerificationResult>> verifyQrCode(String qrCode) async {
    var url = '/api/wallet/vp/verify';

    try {
      final response =
          await dio.post(url, data: {"qrCode": qrCode, "vpAddress": "zetrix"});

      VcGeneralResp<VcVerificationResult> wrappedResp =
          VcGeneralResp<VcVerificationResult>.fromJson(
              response.data,
              (json) =>
                  VcVerificationResult.fromJson(json as Map<String, dynamic>));

      if (wrappedResp.errorCode == SdkError.success.code) {
        return SDKResult.success(data: wrappedResp.data);
      } else if (wrappedResp.errorCode == SdkError.accessTokenInvalid.code) {
        return SDKResult.failure(
            error: DefaultError(
                wrappedResp.message ?? SdkError.accessTokenInvalid.toString()));
      } else {
        return SDKResult.failure(
            error: DefaultError(
                wrappedResp.message ?? SdkError.resultNotFound.toString()));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return SDKResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<SDKResult<VcFinalizeResp>> signedVc(VcFinalizeReq req) async {
    var signedVc = jsonDecode(req.vc ?? '');

    // Add proof
    VcVpProof vcProof = VcVpProof();
    vcProof.type = "sel-disclose-SM2";
    vcProof.created = DateTime.now().toString();
    vcProof.verificationMethod = '${signedVc['issuer']}#Key-1';
    vcProof.proofPurpose = "assertionMethod";
    vcProof.jws = req.vcjws;

    signedVc['proof'] = vcProof.toJson();

    // Create the VP response
    final vcResp = VcFinalizeResp(vc: jsonEncode(signedVc));

    // Return the API result
    return SDKResult.success(data: vcResp);
  }
}
