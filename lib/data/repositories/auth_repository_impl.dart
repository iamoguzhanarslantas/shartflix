import 'package:shartflix/data/datasources/remote_data_source.dart';
import 'package:shartflix/data/models/user_model.dart';
import 'package:shartflix/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<UserModel> login(String email, String password) {
    return remoteDataSource.login(email, password);
  }

  @override
  Future<UserModel> register(String email, String password, String username) {
    return remoteDataSource.register(email, password, username);
  }

  @override
  Future<UserModel> getUserProfile() {
    return remoteDataSource.getUserProfile();
  }

  @override
  Future<void> uploadPhoto(String imagePath) {
    return remoteDataSource.uploadPhoto(imagePath);
  }
}
