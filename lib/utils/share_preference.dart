 import 'dart:convert';


 class SharedPreferences{
      static const String _authTokenKey = 'auth_token';
  static const String _userKey = 'user_data';
 
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
  static Future<bool> clearAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(_authTokenKey);
  }

  /// Save user data to shared preferences
  static Future<bool> saveUserData(Map<String, dynamic> userData) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(_userKey, jsonEncode(userData));
  }

  /// Get user data from shared preferences
  static Future<Map<String, dynamic>?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userDataString = prefs.getString(_userKey);
    if (userDataString != null) {
      return jsonDecode(userDataString) as Map<String, dynamic>;
    }
    return null;
  }

  /// Clear user data from shared preferences
  static Future<bool> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(_userKey);
  }
  
  static Future getInstance() async {}
 }
 
 
