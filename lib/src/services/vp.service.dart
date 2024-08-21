import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:zetrix_flutter/src/models/sdk-result.dart';
import 'package:zetrix_flutter/src/models/vp/credential-parse.dart';
import 'package:zetrix_flutter/src/models/vp/vp-finalize-req.dart';
import 'package:zetrix_flutter/src/models/vp/vc-vp-proof.dart';
import 'package:zetrix_flutter/src/models/vp/vp-generate-req.dart';
import 'package:zetrix_flutter/src/models/vp/vp-generate-resp.dart';
import 'package:zetrix_flutter/src/models/vp/vp-generate-result.dart';
import 'package:zetrix_flutter/src/models/vp/vp-presentation.dart';

import 'base_cred.service.dart';

class ZetrixVpService extends BaseCredService {
  ZetrixVpService(bool mainnet) : super(mainnet);

  final storage = const FlutterSecureStorage();

  Future<SDKResult<VpGenerateResp>> generateVp(VpGenerateReq req) async {
    final vpResult = VerifiablePresentation();

    // Add context
    const List<String> contexts = ["https://www.w3.org/2018/credentials/v1"];
    vpResult.context = contexts;

    // Add vp types
    const List<String> types = ["VerifiablePresentation"];
    vpResult.type = types;

    // Add vp credential request jws
    VpGenerateResult vpGenerateResult = VpGenerateResult();
    vpGenerateResult.jws = req.jws;
    vpResult.credentialRequest = vpGenerateResult.jws;

    vpResult.credentialParse ??= [];

    // Add credential parse
    CredentialParse credentialParse = CredentialParse();
    credentialParse.parseType = "sel-disclose-SM2";
    credentialParse.format = "jws";
    vpResult.credentialParse?.add(credentialParse);

    // Add verifiable credential
    List<Map<String, dynamic>> vc = [];
    vc.add(await jsonDecode(req.finalizedVc ?? ''));
    vpResult.verifiableCredential = vc;

    // Add the proof to the VP
    vpResult.proof = null;

    print(jsonEncode(vpResult.toJson()));

    // Create the VP response
    final vpResp = VpGenerateResp(vp: vpResult);

    // Return the API result
    return SDKResult.success(data: vpResp);
  }

  Future<SDKResult<VpGenerateResp>> signedVp(VpFinalizeReq req) async {
    final vpResult = VerifiablePresentation();

    // Add proof
    VcVpProof vcVpProof = VcVpProof();
    vcVpProof.type = "sel-disclose-SM2";
    vcVpProof.created = DateTime.now().toString();
    vcVpProof.verificationMethod = '${req.holder}#Key-1';
    vcVpProof.proofPurpose = "assertionMethod";
    vcVpProof.jws = req.vpjws;

    vpResult.proof = vcVpProof;

    // Create the VP response
    final vpResp = VpGenerateResp(vp: vpResult);

    // Return the API result
    return SDKResult.success(data: vpResp);
  }
}
