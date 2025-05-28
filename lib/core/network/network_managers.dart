import 'package:casekarao/utils/share_preference.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';


class NetworkManagers extends GetxService {
  late Dio _dio;
  //final RxBool isLoading = false.obs;
  static const String baseUrl = 'https://staging.casekarao.com/api';
  // static const String _baseUrl = 'https://staging.casekarao.com/api';
  static const int _timeout = 30000; // 30 seconds
  //  BuildContext? get safeContext => Get.context!.mounted 
  //     ? Get.context 
  //     : Get.overlayContext;

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
        //isLoading.value = true;
         EasyLoading.show(status: 'Logging...');
        
        // Add authorization token if needed
        // options.headers['Authorization'] = 'Bearer your_token';
          //  final token = await SharedPreferences.getAuthToken();
          // if (token != null && token.isNotEmpty) {
          //   options.headers['Authorization'] = 'Bearer $token';
          // }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        //isLoading.value = false;
        EasyLoading.dismiss();
        return handler.next(response);
      },
      onError: (DioException error, handler) {
        //isLoading.value = false;
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



// class LoaderWidget extends StatelessWidget {
//   final String? message;
//   final bool isCupertinoStyle;
//   final Color? color;
//   final double strokeWidth;

//   const LoaderWidget({
//     super.key,
//     this.message,
//     this.isCupertinoStyle = false,
//     this.color,
//     this.strokeWidth = 4.0,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       child: Center(
//         child: Container(
//           padding: const EdgeInsets.all(20),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               isCupertinoStyle
//                   ? const CupertinoActivityIndicator(radius: 16)
//                   : CircularProgressIndicator(
//                       strokeWidth: strokeWidth,
//                       valueColor: AlwaysStoppedAnimation<Color>(
//                         color ?? Get.theme.primaryColor,
//                       ),
//                     ),
//               if (message != null)
//                 Padding(
//                   padding: const EdgeInsets.only(top: 16),
//                   child: Text(
//                     message!,
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class LoadingDialog {
//   static void show({
//     String? message,
//     bool isCupertinoStyle = false,
//     Color? color,
//     double strokeWidth = 4.0,
//   }) {
//     Get.dialog(
//       LoaderWidget(
//         message: message,
//         isCupertinoStyle: isCupertinoStyle,
//         color: color,
//         strokeWidth: strokeWidth,
//       ),
//       barrierDismissible: false,
//       useSafeArea: true,
//     );
//   }

//   static void dismiss() {
//     if (Get.isDialogOpen == true) Get.back();
//   }
// }