import 'package:flutter/foundation.dart';

class UserModel {
  final String? id;
  final String? email;
  final String? name; // Changed from username to name
  final String? photoUrl;
  final String? token; // Add token field

  UserModel({
    this.id,
    this.email,
    this.name, // Initialize name
    this.photoUrl,
    this.token, // Initialize token
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    debugPrint('UserModel.fromJson raw json: $json'); // Added for debugging

    // First, try to parse from a nested 'data' map (typical for API responses)
    Map<String, dynamic>? data = json['data'];
    if (data != null) {
      return UserModel(
        id: data['id'] ?? data['_id'], // API might use '_id' or 'id'
        email: data['email'],
        name: data['name'],
        photoUrl: data['photoUrl'],
        token: data['token'],
      );
    }

    // If no nested 'data' map, try to parse directly from the top-level JSON (typical for local storage)
    return UserModel(
      id: json['id'] ?? json['_id'],
      email: json['email'],
      name: json['name'],
      photoUrl: json['photoUrl'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name, // Include name in JSON
      'photoUrl': photoUrl,
      'token': token, // Include token in JSON
    };
  }
}
