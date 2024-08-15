import 'dart:convert';

class VpJws {
  var vpPrivate = '';

  Future<String> signJws(String objStr) async {
    // JWS header
    var jwsHeader = {
      'alg': 'SM2',
    };
    // Header string
    var headerStr = base64UrlEncode(utf8.encode(jsonEncode(jwsHeader)));

    // Payload
    var payloadStr = base64UrlEncode(utf8.encode(objStr));
    var needSignStr = '$headerStr.$payloadStr';

    return needSignStr;
  }

  Future<String> buildJws(String needSignStr, String signStr) async {
    
    // Signed String
    return '$needSignStr.$signStr';
  }
}
