// /// A generic class that represents an API response.
// class ApiResponse<T> {
//   Status status;
//   T? data;
//   String? message;
//   int? statusCode;

//   ApiResponse.initial() : status = Status.initial;

//   ApiResponse.loading() : status = Status.loading;

//   ApiResponse.completed(this.data) : status = Status.completed;

//   ApiResponse.error(this.message, {this.statusCode}) : status = Status.error;

//   @override
//   String toString() {
//     return "Status: $status \nMessage: $message \nData: $data";
//   }
// }

// /// Status of the API response.
// enum Status { initial, loading, completed, error }
