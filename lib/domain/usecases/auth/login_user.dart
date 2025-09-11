import 'package:shartflix/data/models/user_model.dart';
import 'package:shartflix/domain/repositories/auth_repository.dart';

class LoginUser {
  final AuthRepository repository;

  LoginUser(this.repository);

  Future<UserModel> call(String email, String password) {
    return repository.login(email, password);
  }
}
