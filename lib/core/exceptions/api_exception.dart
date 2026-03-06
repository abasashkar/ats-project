// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:resume_pro/core/exceptions/app_exception.dart';
// import 'package:resume_pro/core/exceptions/general_exception.dart';

// class ApiException extends AppException {
//   ApiException({super.message, required super.generalMessage});
// }

// class BadRequestException extends ApiException {
//   BadRequestException({super.message, required super.generalMessage});
// }

// class UnauthorizedException extends ApiException {
//   UnauthorizedException({super.message, required super.generalMessage});
// }

// class ForbiddenException extends ApiException {
//   ForbiddenException({super.message, required super.generalMessage});
// }

// class NotFoundException extends ApiException {
//   NotFoundException({super.message, required super.generalMessage});
// }

// class ConflictException extends ApiException {
//   ConflictException({super.message, required super.generalMessage});
// }

// class InternalServerErrorException extends ApiException {
//   InternalServerErrorException({super.message, required super.generalMessage});
// }

// class BadGatewayException extends ApiException {
//   BadGatewayException({super.message, required super.generalMessage});
// }

// class ServiceUnavailableException extends ApiException {
//   ServiceUnavailableException({super.message, required super.generalMessage});
// }

// class ApiErrorHandler {
//   Exception handleError(error) {
//     if (error is DioException) {
//       final e = error.response;
//       final message = e?.data['error']['message'] as String? ?? error.message;

//       switch (e?.statusCode) {
//         case 400:
//           return BadRequestException(message: message, generalMessage: 'Bad request');
//         case 401:
//           return UnauthorizedException(message: message, generalMessage: 'Unauthorized');
//         case 403:
//           return ForbiddenException(message: message, generalMessage: 'Forbidden');
//         case 404:
//           return NotFoundException(message: message, generalMessage: 'Not found');
//         case 409:
//           return ConflictException(message: message, generalMessage: 'Conflict');
//         case 500:
//           return InternalServerErrorException(message: message, generalMessage: 'Internal server error');
//         case 502:
//           return BadGatewayException(message: message, generalMessage: 'Bad gateway');
//         case 503:
//           return ServiceUnavailableException(message: message, generalMessage: 'Service unavailable');
//         default:
//           if (error.type == DioExceptionType.connectionError) {
//             return GeneralErrorHandler.handleError(SocketException(error.message ?? 'Internet connection error'));
//           }
//           return ApiException(message: message, generalMessage: 'Unknown error');
//       }
//     } else {
//       return ApiException(message: error.toString(), generalMessage: 'Unknown error');
//     }
//   }
// }
