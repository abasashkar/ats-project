// import 'dart:async';
// import 'dart:io';

// import 'package:resume_pro/core/exceptions/app_exception.dart';

// class GeneralException extends AppException {
//   GeneralException({super.message, required super.generalMessage});
// }

// class GeneralErrorHandler {
//   static GeneralException handleError(dynamic error) {
//     String generalMessage;
//     String? message;

//     if (error is IOException) {
//       message = error.toString();
//       generalMessage = 'Network Error Occurred';
//     } else if (error is SocketException) {
//       message = error.message;
//       generalMessage = 'No Internet Connection';
//     } else if (error is TimeoutException) {
//       message = error.message;
//       generalMessage = 'Request Timeout';
//     } else if (error is FormatException) {
//       message = error.message;
//       generalMessage = 'Bad response format';
//     } else {
//       message = error.toString();
//       generalMessage = 'Something went wrong';
//     }

//     return GeneralException(message: message, generalMessage: generalMessage);
//   }
// }
