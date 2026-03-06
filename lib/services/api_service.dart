// import 'package:dio/dio.dart';
// import 'package:resume_pro/services/api_response.dart';

// class ApiService {
//   final Dio _dio;

//   ApiService(this._dio);

//   Future<ApiResponse<T>> post<T>(String path, dynamic data) async {
//     try {
//       final response = await _dio.post(path, data: data);

//       return ApiResponse.success(response.data as T, message: response.data is Map ? response.data["message"] : null);
//     } on DioException catch (e) {
//       final message = e.response?.data is Map ? e.response?.data["message"] : "Something went wrong";

//       return ApiResponse.failure(message ?? "Something went wrong");
//     } catch (e) {
//       return ApiResponse.failure("Unexpected error occurred");
//     }
//   }

//   Future<ApiResponse<T>> get<T>(String path) async {
//     try {
//       final response = await _dio.get(path);

//       return ApiResponse.success(response.data as T, message: response.data is Map ? response.data["message"] : null);
//     } on DioException catch (e) {
//       final message = e.response?.data is Map ? e.response?.data["message"] : "Something went wrong";

//       return ApiResponse.failure(message ?? "Something went wrong");
//     } catch (e) {
//       return ApiResponse.failure("Unexpected error occurred");
//     }
//   }
// }
