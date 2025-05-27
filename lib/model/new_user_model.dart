class NewUser {
    final bool status;
    final String message;
    final Data data;
    final Errors errors;
    final String apiToken;
    final int otp;

    NewUser({
        required this.status,
        required this.message,
        required this.data,
        required this.errors,
        required this.apiToken,
        required this.otp,
    });

    factory NewUser.fromJson(Map<String, dynamic> json) {
        return NewUser(
            status: json['status'] ?? false,
            message: json['message'] ?? '',
            data: Data.fromJson(json['data'] ?? {}),
            errors: Errors.fromJson(json['errors'] ?? {}),
            apiToken: json['api_token'] ?? '',
            otp: json['otp'] ?? 0,
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'status': status,
            'message': message,
            'data': data.toJson(),
            'errors': errors.toJson(),
            'api_token': apiToken,
            'otp': otp,
        };
    }
}

class Data {
    final String name;
    final String email;
    final String phone;
    final String password;
    final int otp;
    final String updatedAt;
    final String createdAt;
    final int id;
    final String apiToken;

    Data({
        required this.name,
        required this.email,
        required this.phone,
        required this.password,
        required this.otp,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
        required this.apiToken,
    });

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            name: json['name'] ?? '',
            email: json['email'] ?? '',
            phone: json['phone'] ?? '',
            password: json['password'] ?? '',
            otp: json['otp'] ?? 0,
            updatedAt: json['updated_at'] ?? '',
            createdAt: json['created_at'] ?? '',
            id: json['id'] ?? 0,
            apiToken: json['api_token'] ?? '',
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'name': name,
            'email': email,
            'phone': phone,
            'password': password,
            'otp': otp,
            'updated_at': updatedAt,
            'created_at': createdAt,
            'id': id,
            'api_token': apiToken,
        };
    }
}

class Errors {
    final Map<String, dynamic> errors;

    Errors({this.errors = const {}});

    factory Errors.fromJson(Map<String, dynamic> json) {
        return Errors(
            errors: json,
        );
    }

    Map<String, dynamic> toJson() {
        return errors;
    }
}
