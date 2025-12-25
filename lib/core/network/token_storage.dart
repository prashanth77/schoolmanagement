import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static const _storage = FlutterSecureStorage();
  static const _keyToken = 'accessToken';
  static const _keyExpiry = 'tokenExpiry';

  /// Save token and expiry date
  static Future<void> saveToken(String token, DateTime expiry) async {
    await _storage.write(key: _keyToken, value: token);
    await _storage.write(key: _keyExpiry, value: expiry.toIso8601String());
  }

  static Future<String?> getToken() async {
    return await _storage.read(key: _keyToken);
  }

  static Future<DateTime?> getExpiry() async {
    final expiryString = await _storage.read(key: _keyExpiry);
    if (expiryString == null) return null;
    return DateTime.tryParse(expiryString);
  }

  /// Check if token is expired
  static Future<bool> isTokenValid() async {
    final expiry = await getExpiry();
    if (expiry == null) return false;
    return DateTime.now().isBefore(expiry);
  }

  static Future<void> clearToken() async {
    await _storage.delete(key: _keyToken);
    await _storage.delete(key: _keyExpiry);
  }
}
