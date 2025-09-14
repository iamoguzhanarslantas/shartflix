import 'package:shartflix/data/entities/user_entity.dart';

abstract class IAuthRepository {
  Future<UserEntity> login(String email, String password);
  Future<UserEntity> register(String email, String password, String name);
  Future<UserEntity> getUserProfile();
  Future<void> uploadUserPhoto(String imagePath);
  Future<void> saveAuthToken(String token);
  Future<String?> getAuthToken();
  Future<void> removeAuthToken();
  Future<void> saveUser(UserEntity user);
  Future<UserEntity?> getUser();
  Future<void> setIsNewUser(bool isNewUser);
  Future<bool?> getIsNewUser();
  Future<void> updateUserProfilePhoto(String? photoUrl); // New method
}
