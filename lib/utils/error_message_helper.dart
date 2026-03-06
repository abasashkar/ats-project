// import 'package:dio/dio.dart';

// class ErrorMessageHelper {
//   ErrorMessageHelper._();
//   static String friendlyMessage(Object error, {String? fallback}) {
//     final fallbackMsg = fallback ?? 'Something went wrong. Please try again.';

//     if (error is DioException) {
//       switch (error.type) {
//         case DioExceptionType.connectionTimeout:
//         case DioExceptionType.sendTimeout:
//         case DioExceptionType.receiveTimeout:
//         case DioExceptionType.badCertificate:
//           return 'Request timed out. Check your connection and try again.';
//         case DioExceptionType.connectionError:
//           return 'No internet connection. Showing cached data when available.';
//         case DioExceptionType.unknown:
//           if (error.error?.toString().contains('SocketException') == true ||
//               error.error?.toString().toLowerCase().contains('network') == true) {
//             return 'No internet connection. Showing cached data when available.';
//           }
//           break;
//         default:
//           break;
//       }
//       final statusCode = error.response?.statusCode;
//       if (statusCode != null) {
//         if (statusCode == 401) return 'Session expired. Please sign in again.';
//         if (statusCode == 403) return 'You don\'t have access to this.';
//         if (statusCode >= 500) return 'Server error. Please try again later.';
//       }
//     }
//     final msg = error.toString().toLowerCase();
//     if (msg.contains('socket') || msg.contains('connection') || msg.contains('network')) {
//       return 'No internet connection. Showing cached data when available.';
//     }
//     if (msg.contains('timeout')) {
//       return 'Request timed out. Check your connection and try again.';
//     }
//     return fallbackMsg;
//   }
// }
