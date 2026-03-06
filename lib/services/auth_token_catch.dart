// import 'package:resume_pro/services/local_storage_service.dart';

// class AuthTokenCache {
//   AuthTokenCache._();
//   static final AuthTokenCache instance = AuthTokenCache._();

//   String? _token;
//   String? _role;
//   bool _loaded = false;
//   bool _loadStarted = false;

//   String? get token => _token;
//   bool? get IsLoaded => _loaded;

//   String? getToken() => _token;
//   String? getRole() => _role;

//   bool get isAdmin => _role == 'ADMIN';

//   void setToken(String? value) {
//     _token = value;
//     _loaded = true;
//   }

//   void setRole(String? value) {
//     _role = value;
//   }

/*************  ✨ Windsurf Command ⭐  *************/
/*******  b3a73e81-167e-4f09-8f58-8110404076b2  *******/
//   void clear() {
//     _token = null;
//     _role = null;
//     _loaded = true;
//   }

//   void ensureLoaded(void Function() onLoaded) {
//     if (_loaded) return;
//     if (_loadStarted) return;
//     _loaded = true;
//     Future.wait([LocalStorageService().getAccessToken(), LocalStorageService().getUserRole()]).then((values) {
//       _token = values[0];
//       _role = values[1];
//       onLoaded();
//     });
//   }
// }
