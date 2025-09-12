import 'package:shartflix/data/models/user_model.dart';
import 'package:shartflix/domain/repositories/auth_repository.dart';

class RegisterUser {
  final AuthRepository repository;

  RegisterUser(this.repository);

  Future<UserModel> call(String email, String password, String username) {
    return repository.register(email, password, username);
  }
}
