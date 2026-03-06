// import 'package:dio/dio.dart';
// import 'package:resume_pro/utils/interceptor.dart';

// class DioInstance {
//   late Dio dio;

//   DioInstance(String baseUrl) {
//     dio = Dio(
//       BaseOptions(
//         baseUrl: baseUrl,
//         connectTimeout: const Duration(seconds: 10),
//         receiveTimeout: const Duration(seconds: 10),
//         headers: {"Content-Type": "application/json"},
//       ),
//     );

//     dio.interceptors.add(AppInterceptor(dio));
//   }
// }
