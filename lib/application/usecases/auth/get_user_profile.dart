import 'package:shartflix/domain/entities/user_entity.dart'; // Import UserEntity
import 'package:shartflix/domain/repositories/auth_repository.dart';

class GetUserProfile {
  final AuthRepository repository;

  GetUserProfile(this.repository);

  Future<UserEntity> call() {
    return repository.getUserProfile().then((userModel) => userModel.toEntity());
  }
}
