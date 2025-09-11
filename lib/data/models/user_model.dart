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
    print('UserModel.fromJson raw json: $json'); // Added for debugging
    final Map<String, dynamic>? data = json['data']; // Access the nested 'data' map

    return UserModel(
      id: data?['id'],
      email: data?['email'],
      name: data?['name'], // Parse name from nested 'data'
      photoUrl: data?['photoUrl'],
      token: data?['token'], // Parse token from nested 'data'
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
