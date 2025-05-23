/// Custom exception class for handling API errors
class ApiException implements Exception {
  final String? message;
  final int? statusCode;
  final dynamic response;

  ApiException({this.message, this.statusCode, this.response});

  @override
  String toString() {
    return 'ApiException: {statusCode: $statusCode, message: $message, response: $response}';
  }
}
