import 'dart:math';

import 'dart:convert' show utf8;
import 'package:convert/convert.dart';
import 'tools.dart';

class Utils {
  static String gasToUGas(String gas) {
    if (!Tools.isAvailableZTX(gas)) {
      return '';
    }
    num oneMo = pow(10, 6);
    return (num.parse(gas) * oneMo).toString();
  }

  static String ugasToGas(String ugas) {
    if (!Tools.isAvailableValue(ugas)) {
      return '';
    }
    num oneMo = pow(10, 6);
    return (num.parse(ugas) / oneMo).toString();
  }

  static String unitWithDecimals(String amount, String decimal) {
    final regex = RegExp(r"^[0-9]+$");

    if (!regex.hasMatch(amount) || !regex.hasMatch(decimal)) {
      return '';
    }
    num oneMo = pow(10, int.parse(decimal));
    num amountWithDecimals = num.parse(amount) * oneMo;
    if (amountWithDecimals >= 0 && amountWithDecimals <= double.maxFinite) {
      return amountWithDecimals.toString();
    }
    return '';
  }

  static String utfToHex(String str) {
    if (Tools.isEmptyString(str)) {
      return '';
    }

    var encoded = utf8.encode(str);
    return encoded.map((e) => e.toRadixString(16)).join();
  }

  static String hexToUtf(String str) {
    final regex = RegExp(r"^[0-9a-fA-F]+$");
    if (Tools.isEmptyString(str) || !regex.hasMatch(str)) {
      return '';
    }

    var encoded = hex.decode(str);
    return utf8.decode(encoded);
  }
}
