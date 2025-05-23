/// Custom exception class for handling API errors
class ApiException implements Exception {
  final String? message;
  final int? statusCode;
  final String? response;

  ApiException({this.message, this.statusCode, this.response});

  @override
  String toString() {
    return 'ApiException: {statusCode: $statusCode, message: $message, response: $response}';
  }
}

/// Exception thrown when connection timeout occurs
class ConnectionTimeoutException extends ApiException {
  ConnectionTimeoutException({String? message})
      : super(message: message ?? 'Connection timeout', statusCode: 408);
}

/// Exception thrown when server returns an error
class ServerException extends ApiException {
  ServerException({String? message, int? statusCode, String? response})
      : super(
            message: message ?? 'Server error',
            statusCode: statusCode ?? 500,
            response: response);
}

/// Exception thrown when there's no internet connection
class NoInternetException extends ApiException {
  NoInternetException({String? message})
      : super(message: message ?? 'No internet connection', statusCode: 0);
}

/// Exception thrown when unauthorized access is attempted
class UnauthorizedException extends ApiException {
  UnauthorizedException({String? message, String? response})
      : super(
            message: message ?? 'Unauthorized access',
            statusCode: 401,
            response: response);
}

/// Exception thrown when a resource is not found
class NotFoundException extends ApiException {
  NotFoundException({String? message, String? response})
      : super(
            message: message ?? 'Resource not found',
            statusCode: 404,
            response: response);
}

/// Exception thrown when a bad request is made
class BadRequestException extends ApiException {
  BadRequestException({String? message, String? response})
      : super(
            message: message ?? 'Bad request',
            statusCode: 400,
            response: response);
}

/// Exception thrown when there's a conflict
class ConflictException extends ApiException {
  ConflictException({String? message, String? response})
      : super(
            message: message ?? 'Conflict occurred',
            statusCode: 409,
            response: response);
}

/// Exception thrown for any other error
class OtherException extends ApiException {
  OtherException({String? message, int? statusCode, String? response})
      : super(
            message: message ?? 'Something went wrong',
            statusCode: statusCode,
            response: response);
}
