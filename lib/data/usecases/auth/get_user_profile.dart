import 'package:shartflix/data/entities/user_entity.dart'; // Import UserEntity
import 'package:shartflix/data/repositories/i_auth_repository.dart';

class GetUserProfile {
  final IAuthRepository repository;

  GetUserProfile(this.repository);

  Future<UserEntity> call() {
    return repository.getUserProfile();
  }
}
