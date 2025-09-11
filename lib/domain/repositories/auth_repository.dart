import 'package:shartflix/data/models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(String email, String password, String username);
  Future<UserModel> getUserProfile();
  Future<void> uploadPhoto(String imagePath);
}
