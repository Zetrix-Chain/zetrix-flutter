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
}
