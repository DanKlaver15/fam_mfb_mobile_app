import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageController {
  // Create storage
  final storage = const FlutterSecureStorage();

  final String _keyUserName = '';
  final String _keyPassWord = '';
  final String _token = '';

  //Username
  Future setUserName(String username) async {
    await storage.write(key: _keyUserName, value: username);
  }
  Future<String?> getUserName() async {
    return await storage.read(key: _keyUserName);
  }

  //Password
  Future setPassWord(String password) async {
    await storage.write(key: _keyPassWord, value: password);
  }
  Future<String?> getPassWord() async {
    return await storage.read(key: _keyPassWord);
  }

  //Token
  Future setToken(String token) async {
    await storage.write(key: _token, value: token);
  }
  Future<String?> getToken() async {
    return await storage.read(key: _token);
  }
}