import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shartflix/data/models/user_model.dart';
import 'package:shartflix/domain/usecases/auth/get_user_profile.dart';
import 'package:shartflix/domain/usecases/auth/login_user.dart';
import 'package:shartflix/domain/usecases/auth/register_user.dart';
import 'package:shartflix/domain/usecases/auth/upload_user_photo.dart';
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
  })  : _loginUser = loginUser,
        _registerUser = registerUser,
        _getUserProfile = getUserProfile,
        _uploadUserPhoto = uploadUserPhoto,
        _localStorageService = localStorageService,
        super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await _loginUser(email, password);
      if (user.token != null) {
        await _localStorageService.saveAuthToken(user.token!);
        await _localStorageService.setIsNewUser(false); // Not a new user if logging in
      }
      emit(AuthAuthenticated(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> register(String email, String password, String username) async {
    emit(AuthLoading());
    try {
      final user = await _registerUser(email, password, username);
      if (user.token != null) {
        await _localStorageService.saveAuthToken(user.token!);
        await _localStorageService.setIsNewUser(true); // Mark as new user
      }
      emit(AuthAuthenticated(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> getUserProfile() async {
    emit(AuthLoading());
    try {
      final user = await _getUserProfile();
      emit(AuthAuthenticated(user));
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

  void logout() {
    emit(AuthUnauthenticated());
  }
}
