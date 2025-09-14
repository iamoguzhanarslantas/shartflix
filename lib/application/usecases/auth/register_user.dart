import 'package:shartflix/domain/entities/user_entity.dart';
import 'package:shartflix/domain/repositories/auth_repository.dart';

class RegisterUser {
  final AuthRepository repository;

  RegisterUser(this.repository);

  Future<UserEntity> call(String email, String password, String name) {
    return repository.register(email, password, name);
  }
}
