/// A generic class that represents an API response.
class ApiResponse<T> {
  Status status;
  T? data;
  String? message;
  int? statusCode;

  ApiResponse.initial() : status = Status.INITIAL;

  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.completed(this.data) : status = Status.COMPLETED;

  ApiResponse.error(this.message, {this.statusCode}) : status = Status.ERROR;

  @override
  String toString() {
    return "Status: $status \nMessage: $message \nData: $data";
  }
}

/// Status of the API response.
enum Status { INITIAL, LOADING, COMPLETED, ERROR }
