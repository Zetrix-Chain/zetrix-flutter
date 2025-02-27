import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  writeSecureData(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  readSecureData(String key) async {
    return await storage.read(key: key) ?? 'No data found!';
  }

  deleteSecureData(String key) async {
    await storage.delete(key: key);
  }
}
