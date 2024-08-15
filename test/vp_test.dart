import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zetrix_flutter/src/models/api-result.dart';
import 'package:zetrix_flutter/src/models/network-exceptions.dart';
import 'package:zetrix_flutter/src/models/vc/vc-finalize-resp.dart';
import 'package:zetrix_flutter/src/models/vp/vp-finalize-req.dart';
import 'package:zetrix_flutter/src/models/vp/vp-generate-req.dart';
import 'package:zetrix_flutter/src/models/vp/vp-generate-resp.dart';
import 'package:zetrix_flutter/src/services/vc.service.dart';
import 'package:zetrix_flutter/src/services/vp.service.dart';
import 'package:zetrix_flutter/src/utils/vp_jws.dart';

void main (){
  
  test('generate vp jws', () async {
    final service = VpService(false);
    final VpJws vpJws = VpJws(); 

    VpGenerateReq req = VpGenerateReq();
    req.holder = "did:zid:3bt9zo4RUqF4EgVT9mer57qHAbxqyKzzk7";
    req.finalizedVc = "{\"@context\":[\"https://www.w3.org/2018/credentials/v1\"],\"credentialSubject\":{\"Certificate No\":{\"hash\":\"f266735655ce4103c9f901ff7b3d1435af249d947ba2b1edd918c7b944504bbb\",\"salt\":\"2118467830687980\",\"value\":\"Cert-test-01\"},\"Effective date\":{\"hash\":\"947e0a061bebc474e33f6cf387ddc6ba194a3e4c127b5a0c3d9fcb5c61baf55f\",\"salt\":\"9078012523674043\",\"value\":\"2023/02/13\"},\"Expiry Date\":{\"hash\":\"22ea21a4133c166e9bd5ca964f4308af8852bdddf19f81421f0237cd09cf3b93\",\"salt\":\"9570951733352126\",\"value\":\"2034/02/02\"},\"attr2\":{\"hash\":\"fa7a15c20f1a86473e22644171b354bf06815f16277e8c6c9e33fc3f1ec3f1e3\",\"salt\":\"1743465540312261\",\"value\":\"a2\"},\"id\":\"did:zid:3SDpogP2WBCv12CpVbMbqJyGrJY7L67Vrm\"},\"id\":\"did:zid:3FSpb356ut8FCzvgTw7fUJcE4mECuSAU6d\",\"issuanceDate\":\"2023-12-04T01:36:25Z\",\"issuer\":\"did:zid:3Wk4JiwggfZquiTgj4KwY6wNRFNVTrbgxe\",\"parseType\":\"sel-disclose-SM2\",\"templateId\":\"did:zid:3NfauBr7A2iQYnMH2nskxccVCh7QWHoaSy\",\"type\":[\"VerifiableCredential\"],\"validBefore\":\"2034/02/02\",\"proof\":{\"type\":\"sel-disclose-SM2\",\"created\":\"2024-07-18 13:01:51.682652\",\"verificationMethod\":\"did:zid:3Wk4JiwggfZquiTgj4KwY6wNRFNVTrbgxe#Key-1\",\"proofPurpose\":\"assertionMethod\",\"jws\":\"eyJhbGciOiJTTTIifQ==.eyJAY29udGV4dCI6WyJodHRwczovL3d3dy53My5vcmcvMjAxOC9jcmVkZW50aWFscy92MSJdLCJjcmVkZW50aWFsU3ViamVjdCI6eyJDZXJ0aWZpY2F0ZSBObyI6eyJoYXNoIjoiZjI2NjczNTY1NWNlNDEwM2M5ZjkwMWZmN2IzZDE0MzVhZjI0OWQ5NDdiYTJiMWVkZDkxOGM3Yjk0NDUwNGJiYiIsInNhbHQiOiIyMTE4NDY3ODMwNjg3OTgwIiwidmFsdWUiOiJDZXJ0LXRlc3QtMDEifSwiRWZmZWN0aXZlIGRhdGUiOnsiaGFzaCI6Ijk0N2UwYTA2MWJlYmM0NzRlMzNmNmNmMzg3ZGRjNmJhMTk0YTNlNGMxMjdiNWEwYzNkOWZjYjVjNjFiYWY1NWYiLCJzYWx0IjoiOTA3ODAxMjUyMzY3NDA0MyIsInZhbHVlIjoiMjAyMy8wMi8xMyJ9LCJFeHBpcnkgRGF0ZSI6eyJoYXNoIjoiMjJlYTIxYTQxMzNjMTY2ZTliZDVjYTk2NGY0MzA4YWY4ODUyYmRkZGYxOWY4MTQyMWYwMjM3Y2QwOWNmM2I5MyIsInNhbHQiOiI5NTcwOTUxNzMzMzUyMTI2IiwidmFsdWUiOiIyMDM0LzAyLzAyIn0sImF0dHIyIjp7Imhhc2giOiJmYTdhMTVjMjBmMWE4NjQ3M2UyMjY0NDE3MWIzNTRiZjA2ODE1ZjE2Mjc3ZThjNmM5ZTMzZmMzZjFlYzNmMWUzIiwic2FsdCI6IjE3NDM0NjU1NDAzMTIyNjEiLCJ2YWx1ZSI6ImEyIn0sImlkIjoiZGlkOnppZDozU0Rwb2dQMldCQ3YxMkNwVmJNYnFKeUdySlk3TDY3VnJtIn0sImlkIjoiZGlkOnppZDozRlNwYjM1NnV0OEZDenZnVHc3ZlVKY0U0bUVDdVNBVTZkIiwiaXNzdWFuY2VEYXRlIjoiMjAyMy0xMi0wNFQwMTozNjoyNVoiLCJpc3N1ZXIiOiJkaWQ6emlkOjNXazRKaXdnZ2ZacXVpVGdqNEt3WTZ3TlJGTlZUcmJneGUiLCJwYXJzZVR5cGUiOiJzZWwtZGlzY2xvc2UtU00yIiwidGVtcGxhdGVJZCI6ImRpZDp6aWQ6M05mYXVCcjdBMmlRWW5NSDJuc2t4Y2NWQ2g3UVdIb2FTeSIsInR5cGUiOlsiVmVyaWZpYWJsZUNyZWRlbnRpYWwiXSwidmFsaWRCZWZvcmUiOiIyMDM0LzAyLzAyIiwicHJvb2YiOm51bGx9.8f1ed50904eb88e96f7229a3d48a479e42c41cdeafd19f78841fe9bbbd6dfd0d114ce0467a88c2a363033766651ae0c2e30da61186e20901b131a7dd78a3220d\"}}";

    ApiResult<VpGenerateResp> resp =
        await service.generateVp(req);

    VpGenerateResp? vpGenerateResp;

    resp.when(success: (obj) async {
      vpGenerateResp = obj;
    }, failure: (NetworkExceptions? error) {
      print(error);
      vpGenerateResp = null;
      if (kDebugMode) {}
    });

    expect(vpGenerateResp, isNot(Null));
  });
}