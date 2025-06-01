import 'package:casekarao/utils/share_preference.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class NetworkManagers extends GetxService {
  late Dio _dio;
  static const String baseUrl = 'https://staging.casekarao.com/api';
  static const int _timeout = 30000; // 30 seconds


  void _initializeDio() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(milliseconds: _timeout),
      receiveTimeout: Duration(milliseconds: _timeout),
      // responseType: ResponseType.json,
      // contentType: Headers.jsonContentType,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    // Add interceptors
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
         EasyLoading.show(status: 'Logging...');
        
        // Add authorization token if needed
        final token = await SharedPreferencesHelper.getAuthToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        EasyLoading.dismiss();
        return handler.next(response);
      },
      onError: (DioException error, handler) {
         EasyLoading.dismiss();
        return handler.next(error);
      },
    ));
  }

  Future<dynamic> getRequest(String path, {Map<String, dynamic>? query}) async {
    try {
      return await _dio.get(
        path,
        queryParameters: query,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<dynamic> postRequest(String path, dynamic data) async {
    try {
      return await _dio.post(
        path,
        data: data,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<dynamic> putRequest(
    String path, {
    dynamic data,
    bool isMultipart = false,
  }) async {
    try {
      return await _dio.put(
        path,
        data: data,
        options: Options(
          headers: isMultipart
              ? {'Content-Type': 'multipart/form-data'}
              : null,
        ),
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  String _handleError(DioException error) {
    String errorMessage = 'Something went wrong';
    
    if (error.response != null) {
      switch (error.response?.statusCode) {
        case 400:
          errorMessage = 'Bad request';
          break;
        case 401:
          errorMessage = 'Unauthorized';
          break;
        case 403:
          errorMessage = 'Forbidden';
          break;
        case 404:
          errorMessage = 'Resource not found';
          break;
        case 500:
          errorMessage = 'Internal server error';
          break;
      }
    } else {
      errorMessage = error.message ?? 'Network error occurred';
    }
    
    return errorMessage;
  }

  // Add other methods as needed (DELETE, PATCH, etc.)

  @override
  void onInit() {
    super.onInit();
    _initializeDio();
  }

  @override
  void onClose() {
    // Clean up when app closes
    _dio.close();
    super.onClose();
  }
}