import 'package:equatable/equatable.dart';
import 'package:shartflix/data/models/user_model.dart'; // Import UserModel

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthCheckStatus extends AuthEvent {}

class AuthLogin extends AuthEvent {
  final String email;
  final String password;

  const AuthLogin({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class AuthRegister extends AuthEvent {
  final String email;
  final String password;
  final String name;

  const AuthRegister({required this.email, required this.password, required this.name});

  @override
  List<Object> get props => [email, password, name];
}

class AuthGetUserProfile extends AuthEvent {}

class AuthUploadUserPhoto extends AuthEvent {
  final String imagePath;

  const AuthUploadUserPhoto({required this.imagePath});

  @override
  List<Object> get props => [imagePath];
}

class AuthLogout extends AuthEvent {}

class AuthUpdateUserPhotoUrl extends AuthEvent {
  final String? photoUrl;

  const AuthUpdateUserPhotoUrl({this.photoUrl});

  @override
  List<Object?> get props => [photoUrl];
}

class AuthSkipPhotoUpload extends AuthEvent {
  final UserModel user; // mevcut user modelim
  AuthSkipPhotoUpload({required this.user});

  @override
  List<Object> get props => [user];
}
