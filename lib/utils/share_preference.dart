import 'dart:convert';
import 'package:casekarao/model/auth_user_model.dart';
import 'package:flutter/foundation.dart';
  import 'package:shared_preferences/shared_preferences.dart';

//  class SharedPreferences{
//       static const String _authTokenKey = 'auth_token';
//   static const String _userKey = 'user_data';
 
//  /// Get the authentication token from shared preferences
//   static Future<String?> getAuthToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString(_authTokenKey);
//   }

//   /// Save the authentication token to shared preferences
//   static Future<bool> saveAuthToken(String token) async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.setString(_authTokenKey, token);
//   }

//   /// Clear the authentication token from shared preferences
//   static Future<bool> clearAuthToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.remove(_authTokenKey);
//   }

//   /// Save user data to shared preferences
//   static Future<bool> saveUserData(Map<String, dynamic> userData) async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.setString(_userKey, jsonEncode(userData));
//   }

//   /// Get user data from shared preferences
//   static Future<Map<String, dynamic>?> getUserData() async {
//     final prefs = await SharedPreferences.getInstance();
//     final userDataString = prefs.getString(_userKey);
//     if (userDataString != null) {
//       return jsonDecode(userDataString) as Map<String, dynamic>;
//     }
//     return null;
//   }

//   /// Clear user data from shared preferences
//   static Future<bool> clearUserData() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.remove(_userKey);
//   }
  
//   static Future getInstance() async {}
//  }

 class SharedPreferencesHelper {
  static const String _userKey = 'current_user';
   static const String _authTokenKey = 'auth_token';
   static const String _isUserKey = 'is_user';

  static Future<void> saveUserRole(bool isUser) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isUserKey, isUser);
  }

  static Future<bool> getUserRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isUserKey) ?? true;
  } 

  // Save user to SharedPreferences
  static Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, json.encode(user.toJson()));
  }

  // Get user from SharedPreferences
  static Future<UserModel?> getUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userString = prefs.getString(_userKey);
      if (userString == null) return null;
      
      final userMap = json.decode(userString) as Map<String, dynamic>;
      return UserModel.fromJson(userMap);
    } catch (e) {
      if (kDebugMode) {
        print('Error retrieving user: $e');
      }
      return null;
    }
  }

  /// Get the authentication token from shared preferences
  static Future<String?> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_authTokenKey);
  }

  /// Save the authentication token to shared preferences
  static Future<bool> saveAuthToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(_authTokenKey, token);
  }

  /// Clear the authentication token from shared preferences
  static Future<bool> deleteAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(_authTokenKey);
  }

  // Delete user from SharedPreferences
  static Future<void> deleteUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }

  //UserRole delete 
  static Future<void> deleteRole() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_isUserKey);
  }

  // Clear all SharedPreferences
  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
 
// To get current user
// final currentUser = await SharedPreferencesHelper.getUser();
// if (currentUser != null) {
//   print('Logged in user: ${currentUser.name}');
// }

  //  To get auth token
// final authToken = await SharedPreferencesHelper.getAuthToken();
// if (authToken != null) {
//   print('Auth token: $authToken');
// }

//  To get user role
// final isUser = await SharedPreferencesHelper.getUserRole();
// print('Is user: $isUser');

//  To save user
// await SharedPreferencesHelper.saveUser(user);

//  To logout
// await SharedPreferencesHelper.deleteUser();

//  To clear all SharedPreferences
// await SharedPreferencesHelper.clearAll();
 
