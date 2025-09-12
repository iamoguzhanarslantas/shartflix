import 'dart:convert'; // Import for json encoding/decoding
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart'; // Keep for kDebugMode
import 'package:shartflix/data/models/user_model.dart'; // Import UserModel

class LocalStorageService {
  static const String _authTokenKey = 'authToken';
  static const String _isNewUserKey = 'isNewUser';
  static const String _userModelKey = 'userModel'; // New key for UserModel

  Future<void> saveAuthToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_authTokenKey, token);
    if (kDebugMode) {
      debugPrint('LocalStorageService: Auth token saved: $token');
    }
  }

  Future<String?> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_authTokenKey);
    if (kDebugMode) {
      debugPrint('LocalStorageService: Auth token retrieved: $token');
    }
    return token;
  }

  Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = json.encode(user.toJson());
    await prefs.setString(_userModelKey, userJson);
    if (kDebugMode) {
      debugPrint('LocalStorageService: User model saved: ${user.toJson()}');
    }
  }

  Future<UserModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_userModelKey);
    if (userJson != null) {
      final decodedJson = json.decode(userJson);
      final userModel = UserModel.fromJson(decodedJson);
      if (kDebugMode) {
        debugPrint('LocalStorageService: User model retrieved and parsed: ${userModel.toJson()}');
      }
      return userModel;
    }
    if (kDebugMode) {
      debugPrint('LocalStorageService: No user model found.');
    }
    return null;
  }

  Future<void> removeAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_authTokenKey);
    await prefs.remove(_userModelKey); // Also remove user model
    if (kDebugMode) {
      debugPrint('LocalStorageService: Auth token and user model removed.');
    }
  }

  Future<void> setIsNewUser(bool isNewUser) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isNewUserKey, isNewUser);
  }

  Future<bool> getIsNewUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isNewUserKey) ?? true; // Default to true if not set
  }

  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    if (kDebugMode) {
      debugPrint('LocalStorageService: All local storage cleared.');
    }
  }
}
