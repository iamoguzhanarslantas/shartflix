import 'package:shartflix/core/errors/failures.dart'; // Import Failure types
import 'package:shartflix/core/services/local_storage_service.dart';
import 'package:shartflix/data/datasources/remote_data_source.dart';
import 'package:shartflix/data/models/user_model.dart';
import 'package:shartflix/domain/entities/user_entity.dart';
import 'package:shartflix/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource remoteDataSource;
  final LocalStorageService localStorageService;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localStorageService,
  });

  @override
  Future<UserEntity> login(String email, String password) async {
    try {
      final userModel = await remoteDataSource.login(email, password);
      return userModel.toEntity();
    } on Failure {
      rethrow;
    } catch (e) {
      throw UnknownFailure(e.toString());
    }
  }

  @override
  Future<UserEntity> register(
    String email,
    String password,
    String name,
  ) async {
    try {
      final userModel = await remoteDataSource.register(email, password, name);
      return userModel.toEntity();
    } on Failure {
      rethrow;
    } catch (e) {
      throw UnknownFailure(e.toString());
    }
  }

  @override
  Future<UserEntity> getUserProfile() async {
    try {
      final userModel = await remoteDataSource.getUserProfile();
      return userModel.toEntity();
    } on Failure {
      rethrow;
    } catch (e) {
      throw UnknownFailure(e.toString());
    }
  }

  @override
  Future<void> uploadUserPhoto(String imagePath) async {
    try {
      await remoteDataSource.uploadUserPhoto(imagePath);
    } on Failure {
      rethrow;
    } catch (e) {
      throw UnknownFailure(e.toString());
    }
  }

  @override
  Future<void> saveAuthToken(String token) async {
    try {
      await localStorageService.saveAuthToken(token);
    } on Exception catch (e) {
      throw CacheFailure(e.toString());
    }
  }

  @override
  Future<String?> getAuthToken() async {
    try {
      return await localStorageService.getAuthToken();
    } on Exception catch (e) {
      throw CacheFailure(e.toString());
    }
  }

  @override
  Future<void> removeAuthToken() async {
    try {
      await localStorageService.removeAuthToken();
    } on Exception catch (e) {
      throw CacheFailure(e.toString());
    }
  }

  @override
  Future<void> saveUser(UserEntity user) async {
    // Convert UserEntity to UserModel for local storage
    final userModel = UserModel(
      id: user.id,
      email: user.email,
      name: user.name,
      photoUrl: user.photoUrl,
      token: await localStorageService
          .getAuthToken(), // Preserve existing token
    );
    try {
      await localStorageService.saveUser(userModel);
    } on Exception catch (e) {
      throw CacheFailure(e.toString());
    }
  }

  @override
  Future<UserEntity?> getUser() async {
    try {
      final userModel = await localStorageService.getUser();
      return userModel?.toEntity();
    } on Exception catch (e) {
      throw CacheFailure(e.toString());
    }
  }

  @override
  Future<void> setIsNewUser(bool isNewUser) async {
    try {
      await localStorageService.setIsNewUser(isNewUser);
    } on Exception catch (e) {
      throw CacheFailure(e.toString());
    }
  }

  @override
  Future<bool?> getIsNewUser() async {
    try {
      return await localStorageService.getIsNewUser();
    } on Exception catch (e) {
      throw CacheFailure(e.toString());
    }
  }

  @override
  Future<void> updateUserProfilePhoto(String? photoUrl) async {
    try {
      await remoteDataSource.updateUserProfilePhoto(photoUrl);
      // After updating on remote, update local storage as well
      final currentUser = await localStorageService.getUser();
      if (currentUser != null) {
        final updatedUser = UserModel(
          id: currentUser.id,
          email: currentUser.email,
          name: currentUser.name,
          photoUrl: photoUrl, // Update with the new photoUrl
          token: currentUser.token,
        );
        await localStorageService.saveUser(updatedUser);
      }
    } on Failure {
      rethrow;
    } catch (e) {
      throw UnknownFailure(e.toString());
    }
  }
}
