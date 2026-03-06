// import 'package:dio/dio.dart';
// import 'package:resume_pro/routes/router.dart' as AppRouter;
// import 'package:resume_pro/services/auth_token_catch.dart';
// import 'package:resume_pro/services/local_storage_service.dart';


// class AppInterceptor extends Interceptor {
//   final Dio dio;

//   AppInterceptor(this.dio);

//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     final token = AuthTokenCache.instance.getToken();
//     if (token != null) {
//       options.headers["Authorization"] = "Bearer $token";
//     }
//     print("METHOD: ${options.method}, URL: ${options.uri}, DATA: ${options.data}");
//     handler.next(options);
//   }

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) async {
//     final statusCode = err.response?.statusCode;

     
//      ("ERROR: ${err.response?.statusCode},  MESSAGE: ${err.response}");

//     if (statusCode == 403) {
//       AuthTokenCache.instance.clear();
//       await LocalStorageService().clear();
//       _redirectToLogin();
//       return handler.next(err);
//     }

//     if (statusCode == 401) {
//       final refreshToken = await LocalStorageService().getRefreshToken();

//       if (refreshToken != null) {
//         try {
//           final response = await dio.post(
//             "/refresh",
//             data: {"refreshToken": refreshToken},
//           );

//           final newAccessToken = response.data["accessToken"];
//           if (newAccessToken != null) {
//             await LocalStorageService().saveAccessToken(newAccessToken);
//             AuthTokenCache.instance.setToken(newAccessToken);
//           }

//           err.requestOptions.headers["Authorization"] = "Bearer $newAccessToken";

//           final cloneReq = await dio.fetch(err.requestOptions);
//           return handler.resolve(cloneReq);
//         } catch (e) {
//           AuthTokenCache.instance.clear();
//           await LocalStorageService().clear();
//           _redirectToLogin();
//         }
//       }
//     }

//     return handler.next(err);
//   }

//   void _redirectToLogin() {
//     try {
//       AppRouter.router.go('/login');
//       AppRouter.router.refresh();
//     } catch (_) {}
//   }
// }
