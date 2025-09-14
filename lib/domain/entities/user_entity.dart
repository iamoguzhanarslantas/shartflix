import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  final String? email;
  final String? name;
  final String? photoUrl;

  const UserEntity({
    this.id,
    this.email,
    this.name,
    this.photoUrl,
  });

  @override
  List<Object?> get props => [id, email, name, photoUrl];

  // Method to convert UserEntity to UserModel (for data layer persistence)
  // Note: UserModel will handle the token, as it's a data layer concern.
  // UserEntity should not contain the token.
  Map<String, dynamic> toModelJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'photoUrl': photoUrl,
    };
  }
}
