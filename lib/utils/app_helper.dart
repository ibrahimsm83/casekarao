// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// // import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// /// A utility class that provides helper methods and properties for the entire app
// class AppHelper {
//   // Private constructor to prevent instantiation
//   AppHelper._();

//   // User role constants
//   static const String _userRoleKey = 'user_role';
//   static const int _userRoleUser = 1;
//   static const int _userRoleLawyer = 2;

//   // Static variable to track user type (true = user, false = lawyer)
//   static bool isUser = true;

//   // Initialize the helper class
//   static Future<void> init() async {
//     // Load user role from shared preferences
//     final prefs = await SharedPreferences.getInstance();
//     final userRole = prefs.getInt(_userRoleKey);
    
//     // Set isUser based on stored value, default to true (user) if not set
//     isUser = userRole == null || userRole == _userRoleUser;
//   }

//   /// Save user role to shared preferences
//   static Future<void> saveUserRole(bool isUserRole) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setInt(_userRoleKey, isUserRole ? _userRoleUser : _userRoleLawyer);
//     isUser = isUserRole;
//   }

//   /// Check if the device has internet connection
//   static Future<bool> hasInternetConnection() async {
//     try {
//       final result = await InternetAddress.lookup('google.com');
//       return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
//     } on SocketException catch (_) {
//       return false;
//     }
//   }

  // Format date to a readable string
  // static String formatDate(DateTime date, {String format = 'MMM dd, yyyy'}) {
  //   return DateFormat(format).format(date);
  // }

  // /// Format time to a readable string
  // static String formatTime(DateTime time, {String format = 'hh:mm a'}) {
  //   return DateFormat(format).format(time);
  // }

  // /// Format currency
  // static String formatCurrency(double amount, {String symbol = '\$'}) {
  //   return '$symbol${amount.toStringAsFixed(2)}';
  // }

//   /// Format phone number
//   static String formatPhoneNumber(String phoneNumber) {
//     // Remove any non-digit characters
//     final digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');
    
//     // Format based on length
//     if (digitsOnly.length == 10) {
//       return '(${digitsOnly.substring(0, 3)}) ${digitsOnly.substring(3, 6)}-${digitsOnly.substring(6)}';
//     } else if (digitsOnly.length == 11) {
//       return '+${digitsOnly.substring(0, 1)} (${digitsOnly.substring(1, 4)}) ${digitsOnly.substring(4, 7)}-${digitsOnly.substring(7)}';
//     }
    
//     // Return as is if it doesn't match expected formats
//     return phoneNumber;
//   }

//   /// Validate email address
//   static bool isValidEmail(String email) {
//     return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
//   }

//   /// Validate password (at least 8 characters, 1 uppercase, 1 number)
//   static bool isValidPassword(String password) {
//     return password.length >= 8 && 
//            RegExp(r'[A-Z]').hasMatch(password) && 
//            RegExp(r'[0-9]').hasMatch(password);
//   }

//   /// Get password strength (0.0 to 1.0)
//   static double getPasswordStrength(String password) {
//     int strength = 0;
    
//     // Check length
//     if (password.length >= 8) strength++;
    
//     // Check for uppercase
//     if (RegExp(r'[A-Z]').hasMatch(password)) strength++;
    
//     // Check for numbers
//     if (RegExp(r'[0-9]').hasMatch(password)) strength++;
    
//     // Check for special characters
//     if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) strength++;
    
//     // Return normalized strength (0.0 to 1.0)
//     return strength / 4;
//   }

//   /// Show a snackbar
//   static void showSnackBar(String message, {bool isError = false}) {
//     Get.snackbar(
//       isError ? 'Error' : 'Success',
//       message,
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: isError ? Colors.red : Colors.green,
//       colorText: Colors.white,
//       margin: const EdgeInsets.all(16),
//       duration: const Duration(seconds: 3),
//     );
//   }

//   /// Show a loading dialog
//   static void showLoading({String message = 'Loading...'}) {
//     Get.dialog(
//       Dialog(
//         backgroundColor: Colors.white,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const CircularProgressIndicator(),
//               const SizedBox(height: 16),
//               Text(message),
//             ],
//           ),
//         ),
//       ),
//       barrierDismissible: false,
//     );
//   }

//   /// Hide loading dialog
//   static void hideLoading() {
//     if (Get.isDialogOpen ?? false) {
//       Get.back();
//     }
//   }

//   /// Show a confirmation dialog
//   static Future<bool> showConfirmationDialog({
//     required String title,
//     required String message,
//     String confirmText = 'Confirm',
//     String cancelText = 'Cancel',
//   }) async {
//     final result = await Get.dialog<bool>(
//       AlertDialog(
//         title: Text(title),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () => Get.back(result: false),
//             child: Text(cancelText),
//           ),
//           TextButton(
//             onPressed: () => Get.back(result: true),
//             child: Text(confirmText),
//           ),
//         ],
//       ),
//     );
    
//     return result ?? false;
//   }

//   /// Get screen width
//   static double getScreenWidth(BuildContext context) {
//     return MediaQuery.of(context).size.width;
//   }

//   /// Get screen height
//   static double getScreenHeight(BuildContext context) {
//     return MediaQuery.of(context).size.height;
//   }

//   /// Check if the device is in dark mode
//   static bool isDarkMode(BuildContext context) {
//     return MediaQuery.of(context).platformBrightness == Brightness.dark;
//   }

//   /// Get a random color
//   static Color getRandomColor() {
//     return Color((DateTime.now().millisecondsSinceEpoch % 0xFFFFFF).toInt()).withOpacity(1.0);
//   }
// }
