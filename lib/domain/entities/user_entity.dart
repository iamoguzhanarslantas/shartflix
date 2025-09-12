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
}
