import 'package:shartflix/data/entities/user_entity.dart';

class UserModel {
  final String? id;
  final String? email;
  final String? name; 
  final String? photoUrl;
  final String? token; 

  UserModel({
    this.id,
    this.email,
    this.name, 
    this.photoUrl,
    this.token, 
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    
    Map<String, dynamic>? data = json['data'];
    if (data != null) {
      return UserModel(
        id: data['id'] ?? data['_id'], 
        email: data['email'],
        name: data['name'],
        photoUrl: data['photoUrl'],
        token: data['token'],
      );
    }

    
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
      'name': name, 
      'photoUrl': photoUrl,
      'token': token, 
    };
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      email: email,
      name: name,
      photoUrl: photoUrl,
    );
  }
}
