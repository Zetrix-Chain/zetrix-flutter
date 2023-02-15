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
}
