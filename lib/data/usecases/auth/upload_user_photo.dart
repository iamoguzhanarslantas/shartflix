import 'package:shartflix/data/repositories/i_auth_repository.dart';

class UploadUserPhoto {
  final IAuthRepository repository;

  UploadUserPhoto(this.repository);

  Future<void> call(String imagePath) {
    return repository.uploadUserPhoto(imagePath);
  }
}
