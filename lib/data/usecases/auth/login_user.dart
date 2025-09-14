import 'package:shartflix/data/entities/user_entity.dart';
import 'package:shartflix/data/repositories/i_auth_repository.dart';

class LoginUser {
  final IAuthRepository repository;

  LoginUser(this.repository);

  Future<UserEntity> call(String email, String password) {
    return repository.login(email, password);
  }
}
