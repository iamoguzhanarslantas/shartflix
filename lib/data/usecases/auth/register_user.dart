import 'package:shartflix/data/entities/user_entity.dart';
import 'package:shartflix/data/repositories/i_auth_repository.dart';

class RegisterUser {
  final IAuthRepository repository;

  RegisterUser(this.repository);

  Future<UserEntity> call(String email, String password, String name) {
    return repository.register(email, password, name);
  }
}
