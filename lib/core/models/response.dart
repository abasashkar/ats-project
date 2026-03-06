// class Response {
//   final dynamic data;
//   final Error? error;
//   final bool success;
//   Response({required this.data, required this.error, required this.success});

//   factory Response.fromJson(Map<String, dynamic> json) {
//     return Response(data: json['data'], error: json['error']?.let(Error.fromJson), success: json['success']);
//   }
// }

// class Error {
//   final String message;
//   final String type;
//   final DateTime timestamp;
//   final int statusCode;

//   Error({required this.message, required this.type, required this.timestamp, required this.statusCode});

//   factory Error.fromJson(Map<String, dynamic> json) {
//     return Error(
//       message: json['message'],
//       type: json['type'],
//       timestamp: DateTime.parse(json['timestamp']),
//       statusCode: json['statusCode'],
//     );
//   }
// }
