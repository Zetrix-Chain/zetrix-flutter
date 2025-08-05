import 'package:logger/logger.dart';

class Tools {
  static bool isEmptyString(String? str) {
    return str == null || str.isEmpty;
  }

  static bool isEmptyObject(Object? obj) {
    return obj == null || obj == "";
  }

  static bool isEmptyList(List<Object>? obj) {
    return obj == null || obj.isEmpty;
  }

  static bool isAvailableZTX(String gas) {
    if (isEmptyString(gas)) {
      return false;
    }
    final regex = RegExp(r"^(([1-9]\d*)+|0)(\.\d{1,8})?$");
    return (regex.hasMatch(gas) &&
        double.parse(gas) >= 0 &&
        double.parse(gas) <= double.maxFinite);
  }

  static bool isAvailableValue(String ugas) {
    if (isEmptyString(ugas)) {
      return false;
    }
    final regex = RegExp(r"^(0|([1-9]\d*))$");
    return (regex.hasMatch(ugas) &&
        double.parse(ugas) > -1 &&
        double.parse(ugas) <= double.maxFinite);
  }

  static bool validateParams(Map<String, dynamic> params) {
    bool validated = true;

    params.forEach((k, v) {
      if (v == null) {
        validated = false;
      }
    });

    return validated;
  }

  /// Logs a debug message using the PrettyPrinter format.
  ///
  /// This method initializes a logger with a [PrettyPrinter] and logs the provided message
  /// at the debug (`d`) level. It is primarily used for structured and readable debugging output.
  static void logDebug(dynamic msg) {
    var logger = Logger(
      printer: PrettyPrinter(),
    );
    logger.d(msg);
  }
}
