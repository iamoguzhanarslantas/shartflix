import 'package:shartflix/data/models/user_model.dart';
import 'package:shartflix/domain/repositories/auth_repository.dart';

class GetUserProfile {
  final AuthRepository repository;

  GetUserProfile(this.repository);

  Future<UserModel> call() {
    return repository.getUserProfile();
  }
}
