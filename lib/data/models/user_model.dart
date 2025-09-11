class UserModel {
  final String? id;
  final String? email;
  final String? username;
  final String? photoUrl;
  final String? token; // Add token field

  UserModel({
    this.id,
    this.email,
    this.username,
    this.photoUrl,
    this.token, // Initialize token
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      photoUrl: json['photoUrl'],
      token: json['token'], // Parse token from JSON
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'photoUrl': photoUrl,
      'token': token, // Include token in JSON
    };
  }
}
