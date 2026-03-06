// import 'package:resume_pro/services/auth_token_catch.dart';
// import 'package:resume_pro/services/local_storage_service.dart';

// import '../services/api_response.dart';
// import '../services/api_service.dart';

// class AuthRepository {
//   final ApiService _api;

//   AuthRepository(this._api);

//   static const String _authLoginPath = '/auth/login';
//   static const String _authRegisterPath = '/auth/register';
//   static const String _authLogoutPath = '/auth/logout';

//   Future<ApiResponse<String?>> login(String email, String password) async {
//     try {
//       final response = await _api.post<Map<String, dynamic>>(_authLoginPath, {"email": email, "password": password});

//       if (!response.success || response.data == null) {
//         return ApiResponse.failure(response.message ?? "Invalid credentials");
//       }

//       final data = response.data!;

//       final accessToken = data["accessToken"];
//       final refreshToken = data["refreshToken"];
//       final user = data["user"];
//       final role = user?["role"] as String?;

//       if (accessToken != null && refreshToken != null) {
//         await LocalStorageService().saveTokens(accessToken, refreshToken, role: role);

//         AuthTokenCache.instance.setToken(accessToken);

//         if (role != null) {
//           AuthTokenCache.instance.setRole(role);
//         }
//       }

//       return ApiResponse.success(role, message: "Login Successful");
//     } catch (e) {
//       return ApiResponse.failure("Login failed");
//     }
//   }

//   Future<ApiResponse<void>> register(String name, String email, String password, String role) async {
//     try {
//       final response = await _api.post(_authRegisterPath, {
//         "name": name,
//         "email": email,
//         "password": password,
//         "role": role,
//       });

//       if (!response.success) {
//         return ApiResponse.failure(response.message ?? "Register failed");
//       }

//       return ApiResponse.success(null, message: "Register Successful");
//     } catch (e) {
//       return ApiResponse.failure("Register failed");
//     }
//   }

//   Future<void> logout() async {
//     try {
//       final refreshToken = await LocalStorageService().getRefreshToken();

//       if (refreshToken != null) {
//         await _api.post(_authLogoutPath, {"refreshToken": refreshToken});
//       }
//     } catch (_) {}

//     AuthTokenCache.instance.clear();
//     await LocalStorageService().clear();
//   }
// }
