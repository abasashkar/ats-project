// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class LocalStorageService {
//   static const _storage = FlutterSecureStorage();

//   Future<void> saveTokens(String access, String refresh, {String? role}) async {
//     await _storage.write(key: 'accessToken', value: access);
//     await _storage.write(key: 'refreshToken', value: refresh);
//     if (role != null) await _storage.write(key: 'userRole', value: role);
//   }

//   Future<void> saveUserRole(String role) async {
//     await _storage.write(key: "userRole", value: role);
//   }

//   Future<String?> getUserRole() async {
//     return await _storage.read(key: "userRole");
//   }

//   Future<void> saveAccessToken(String access) async {
//     await _storage.write(key: "accessToken", value: access);
//   }

//   Future<String?> getAccessToken() async {
//     return await _storage.read(key: "accessToken");
//   }

//   Future<String?> getRefreshToken() async {
//     return await _storage.read(key: "refreshToken");
//   }

//   Future<void> clear() async {
//     await _storage.deleteAll();
//   }
// }
