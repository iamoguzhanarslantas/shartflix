import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shartflix/data/models/user_model.dart';
import 'package:shartflix/domain/entities/user_entity.dart'; // Import UserEntity
import 'package:shartflix/application/usecases/auth/get_user_profile.dart';
import 'package:shartflix/application/usecases/auth/login_user.dart';
import 'package:shartflix/application/usecases/auth/register_user.dart';
import 'package:shartflix/application/usecases/auth/upload_user_photo.dart';
import 'package:shartflix/core/services/local_storage_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUser _loginUser;
  final RegisterUser _registerUser;
  final GetUserProfile _getUserProfile;
  final UploadUserPhoto _uploadUserPhoto;
  final LocalStorageService _localStorageService;

  AuthCubit({
    required LoginUser loginUser,
    required RegisterUser registerUser,
    required GetUserProfile getUserProfile,
    required UploadUserPhoto uploadUserPhoto,
    required LocalStorageService localStorageService,
  }) : _loginUser = loginUser,
       _registerUser = registerUser,
       _getUserProfile = getUserProfile,
       _uploadUserPhoto = uploadUserPhoto,
       _localStorageService = localStorageService,
       super(AuthInitial()) {
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    emit(AuthLoading()); // Emit loading state
    final token = await _localStorageService.getAuthToken();
    if (token != null && token.isNotEmpty) {
      final UserModel? retrievedUserModel = await _localStorageService.getUser();

      // Convert UserModel to UserEntity for the state
      final UserEntity? userEntityToEmit = retrievedUserModel?.toEntity();

      // Check if userEntityToEmit is not null and has at least an ID or email to be considered valid
      if (userEntityToEmit != null &&
          (userEntityToEmit.id != null || userEntityToEmit.email != null)) {
        emit(AuthAuthenticated(userEntityToEmit));
      } else {
        try {
          final UserEntity userEntity = await _getUserProfile();
          // Convert UserEntity back to UserModel for local storage
          final UserModel userModelToSave = UserModel(
            id: userEntity.id,
            email: userEntity.email,
            name: userEntity.name,
            photoUrl: userEntity.photoUrl,
            token: token, // Use the existing token for saving
          );
          await _localStorageService.saveUser(userModelToSave);
          emit(AuthAuthenticated(userEntity));
        } catch (e) {
          emit(AuthError(e.toString()));
          await _localStorageService
              .removeAuthToken(); // Clear invalid token and user model
        }
      }
    } else {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final UserModel userModel = await _loginUser(email, password);
      if (userModel.token != null) {
        await _localStorageService.saveAuthToken(userModel.token!);
        await _localStorageService.saveUser(userModel); // Save user model
        await _localStorageService.setIsNewUser(
          false,
        ); // Not a new user if logging in
      }
      // Ensure local storage operations are complete before checking status
      await _checkAuthStatus(); // This will now emit AuthAuthenticated with UserEntity
    } catch (e) {
      // Extract only the message from the exception
      String errorMessage = e.toString().replaceFirst('Exception: ', '');
      emit(AuthError(errorMessage));
    }
  }

  Future<void> register(String email, String password, String name) async {
    emit(AuthLoading());
    try {
      final UserModel userModel = await _registerUser(email, password, name);
      if (userModel.token != null) {
        await _localStorageService.saveAuthToken(userModel.token!);
        await _localStorageService.saveUser(userModel); // Save user model
        await _localStorageService.setIsNewUser(true); // Mark as new user
      }
      emit(AuthRegistrationSuccess(userModel.toEntity())); // Emit UserEntity
    } catch (e) {
      String errorMessage = 'Kayıt başarısız. Lütfen tekrar deneyin.';
      if (e.toString().contains('USER_EXISTS')) {
        errorMessage = 'Bu email adresi zaten kayıtlı.';
      }
      emit(AuthError(errorMessage));
    }
  }

  Future<void> getUserProfile() async {
    emit(AuthLoading());
    try {
      final UserEntity userEntity = await _getUserProfile();
      // Convert UserEntity back to UserModel for local storage
      final UserModel userModelToSave = UserModel(
        id: userEntity.id,
        email: userEntity.email,
        name: userEntity.name,
        photoUrl: userEntity.photoUrl,
        token: await _localStorageService.getAuthToken(), // Retrieve current token
      );
      await _localStorageService.saveUser(userModelToSave);
      emit(AuthAuthenticated(userEntity));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> uploadUserPhoto(String imagePath) async {
    emit(AuthLoading());
    try {
      await _uploadUserPhoto(imagePath);
      // After uploading, refresh profile to get the new photo URL
      await getUserProfile();
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> logout() async {
    emit(AuthLoading()); // Emit loading state
    await _localStorageService
        .removeAuthToken(); // This now also removes user model
    emit(AuthUnauthenticated());
  }
}
