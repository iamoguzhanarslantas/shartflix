import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart'; // Import for debugPrint
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
  }) : _loginUser = loginUser,
       _registerUser = registerUser,
       _getUserProfile = getUserProfile,
       _uploadUserPhoto = uploadUserPhoto,
       _localStorageService = localStorageService,
       super(AuthInitial()) {
    debugPrint('AuthCubit: Initializing and checking auth status.');
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    debugPrint('AuthCubit: _checkAuthStatus called.');
    emit(AuthLoading()); // Emit loading state
    final token = await _localStorageService.getAuthToken();
    if (token != null && token.isNotEmpty) {
      debugPrint(
        'AuthCubit: Token found. Attempting to retrieve user profile from local storage.',
      );
      final UserModel? retrievedUser = await _localStorageService.getUser();
      debugPrint(
        'AuthCubit: Retrieved user from local storage: ${retrievedUser?.toJson()}',
      );

      // Create a defensive copy to prevent unexpected mutations
      final UserModel? userToEmit = retrievedUser != null
          ? UserModel(
              id: retrievedUser.id,
              email: retrievedUser.email,
              name: retrievedUser.name,
              photoUrl: retrievedUser.photoUrl,
              token: retrievedUser.token,
            )
          : null;

      // Check if userToEmit is not null and has at least an ID or email to be considered valid
      if (userToEmit != null &&
          (userToEmit.id != null || userToEmit.email != null)) {
        debugPrint(
          'AuthCubit: Stored user is valid. Emitting AuthAuthenticated from _checkAuthStatus (from local storage) with user: ${userToEmit.toJson()}',
        );
        emit(AuthAuthenticated(userToEmit));
      } else {
        debugPrint(
          'AuthCubit: Stored user is NULL or incomplete. Attempting to fetch profile from API.',
        );
        try {
          final user = await _getUserProfile();
          await _localStorageService.saveUser(
            user,
          ); // Save fetched user to local storage
          emit(AuthAuthenticated(user));
          debugPrint(
            'AuthCubit: Emitted AuthAuthenticated from _checkAuthStatus (from API). User: ${user.toJson()}',
          );
        } catch (e) {
          debugPrint(
            'AuthCubit: Failed to fetch user profile with existing token: $e',
          );
          emit(AuthError(e.toString()));
          debugPrint('AuthCubit: Emitted AuthError from _checkAuthStatus.');
          await _localStorageService
              .removeAuthToken(); // Clear invalid token and user model
        }
      }
    } else {
      debugPrint('AuthCubit: No token found. User is not logged in.');
      emit(AuthUnauthenticated());
      debugPrint(
        'AuthCubit: Emitted AuthUnauthenticated from _checkAuthStatus.',
      );
    }
  }

  Future<void> login(String email, String password) async {
    debugPrint('AuthCubit: Login called for email: $email');
    emit(AuthLoading());
    debugPrint('AuthCubit: Emitted AuthLoading from login.');
    try {
      final user = await _loginUser(email, password);
      if (user.token != null) {
        await _localStorageService.saveAuthToken(user.token!);
        await _localStorageService.saveUser(user); // Save user model
        await _localStorageService.setIsNewUser(
          false,
        ); // Not a new user if logging in
        debugPrint(
          'AuthCubit: User and token saved to local storage after login.',
        );
      }
      final savedToken = await _localStorageService.getAuthToken();
      debugPrint('AuthCubit: Token after saving: $savedToken');
      // Ensure local storage operations are complete before checking status
      await _checkAuthStatus();
      debugPrint(
        'AuthCubit: Login successful, _checkAuthStatus called to refresh state.',
      );
    } catch (e) {
      debugPrint('AuthCubit: Login failed with error: $e');
      // Extract only the message from the exception
      String errorMessage = e.toString().replaceFirst('Exception: ', '');
      emit(AuthError(errorMessage));
      debugPrint(
        'AuthCubit: Emitted AuthError from login. Message: $errorMessage',
      );
    }
  }

  Future<void> register(String email, String password, String name) async {
    debugPrint('AuthCubit: Register called for email: $email, name: $name');
    emit(AuthLoading());
    debugPrint('AuthCubit: Emitted AuthLoading from register.');
    try {
      final user = await _registerUser(email, password, name);
      if (user.token != null) {
        await _localStorageService.saveAuthToken(user.token!);
        await _localStorageService.saveUser(user); // Save user model
        await _localStorageService.setIsNewUser(true); // Mark as new user
      }
      emit(AuthRegistrationSuccess(user));
      debugPrint(
        'AuthCubit: Emitted AuthRegistrationSuccess from register. User: ${user.toJson()}',
      );
    } catch (e) {
      debugPrint('AuthCubit: Register user failed: ${e.toString()}');
      String errorMessage = 'Kayıt başarısız. Lütfen tekrar deneyin.';
      if (e.toString().contains('USER_EXISTS')) {
        errorMessage = 'Bu email adresi zaten kayıtlı.';
      }
      emit(AuthError(errorMessage));
      debugPrint('AuthCubit: Emitted AuthError from register.');
    }
  }

  Future<void> getUserProfile() async {
    debugPrint('AuthCubit: getUserProfile called.');
    emit(AuthLoading());
    debugPrint('AuthCubit: Emitted AuthLoading from getUserProfile.');
    try {
      final user = await _getUserProfile();
      await _localStorageService.saveUser(
        user,
      ); // Save fetched user to local storage
      emit(AuthAuthenticated(user));
      debugPrint('AuthCubit: Emitted AuthAuthenticated from getUserProfile.');
    } catch (e) {
      debugPrint('AuthCubit: Failed to fetch user profile: $e');
      emit(AuthError(e.toString()));
      debugPrint('AuthCubit: Emitted AuthError from getUserProfile.');
    }
  }

  Future<void> uploadUserPhoto(String imagePath) async {
    debugPrint('AuthCubit: uploadUserPhoto called with path: $imagePath');
    emit(AuthLoading());
    debugPrint('AuthCubit: Emitted AuthLoading from uploadUserPhoto.');
    try {
      await _uploadUserPhoto(imagePath);
      // After uploading, refresh profile to get the new photo URL
      await getUserProfile();
      debugPrint('AuthCubit: Photo upload successful, profile refreshed.');
    } catch (e) {
      debugPrint('AuthCubit: Photo upload failed with error: $e');
      emit(AuthError(e.toString()));
      debugPrint('AuthCubit: Emitted AuthError from uploadUserPhoto.');
    }
  }

  Future<void> logout() async {
    debugPrint('AuthCubit: Logout called.');
    await _localStorageService
        .removeAuthToken(); // This now also removes user model
    emit(AuthUnauthenticated());
    debugPrint(
      'AuthCubit: Emitted AuthUnauthenticated from logout. User logged out successfully.',
    );
  }
}
