import 'package:shartflix/domain/repositories/auth_repository.dart';

class UploadUserPhoto {
  final AuthRepository repository;

  UploadUserPhoto(this.repository);

  Future<void> call(String imagePath) {
    return repository.uploadUserPhoto(imagePath);
  }
}
