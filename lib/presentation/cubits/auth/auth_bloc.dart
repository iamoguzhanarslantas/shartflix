import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shartflix/data/entities/user_entity.dart';
import 'package:shartflix/data/repositories/i_auth_repository.dart';
import 'package:shartflix/presentation/cubits/auth/auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _authRepository;

  AuthBloc({required IAuthRepository authRepository})
    : _authRepository = authRepository,
      super(AuthInitial()) {
    on<AuthCheckStatus>(_onAuthCheckStatus);
    on<AuthLogin>(_onAuthLogin);
    on<AuthRegister>(_onAuthRegister);
    on<AuthGetUserProfile>(_onAuthGetUserProfile);
    on<AuthUploadUserPhoto>(_onAuthUploadUserPhoto);
    on<AuthLogout>(_onAuthLogout);
    on<AuthUpdateUserPhotoUrl>(_onAuthUpdateUserPhotoUrl);
    on<AuthSkipPhotoUpload>((event, emit) async {
      emit(AuthLoading());
      try {
        await _authRepository.saveUser(event.user.toEntity());
        emit(AuthAuthenticated(event.user.toEntity()));
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    add(AuthCheckStatus()); 
  }

  Future<void> _onAuthCheckStatus(
    AuthCheckStatus event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final token = await _authRepository.getAuthToken();
      if (token != null && token.isNotEmpty) {
        final UserEntity? userEntity = await _authRepository.getUser();

        if (userEntity != null &&
            (userEntity.id != null || userEntity.email != null)) {
          emit(AuthAuthenticated(userEntity));
        } else {
          final UserEntity fetchedUserEntity = await _authRepository
              .getUserProfile();
          await _authRepository.saveUser(fetchedUserEntity);
          emit(AuthAuthenticated(fetchedUserEntity));
        }
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
      await _authRepository.removeAuthToken();
    }
  }

  Future<void> _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final UserEntity userEntity = await _authRepository.login(
        event.email,
        event.password,
      );
    
      await _authRepository.saveUser(userEntity);
      await _authRepository.setIsNewUser(false);
      add(AuthCheckStatus()); 
    } catch (e) {
      String errorMessage = e.toString().replaceFirst('Exception: ', '');
      emit(AuthError(errorMessage));
    }
  }

  Future<void> _onAuthRegister(
    AuthRegister event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final UserEntity userEntity = await _authRepository.register(
        event.email,
        event.password,
        event.name,
      );
      
      await _authRepository.saveUser(userEntity);
      await _authRepository.setIsNewUser(true);
      emit(AuthRegistrationSuccess(userEntity));
    } catch (e) {
      String errorMessage = 'Kayıt başarısız. Lütfen tekrar deneyin.';
      if (e.toString().contains('USER_EXISTS')) {
        errorMessage = 'Bu email adresi zaten kayıtlı.';
      }
      emit(AuthError(errorMessage));
    }
  }

  Future<void> _onAuthGetUserProfile(
    AuthGetUserProfile event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final UserEntity userEntity = await _authRepository.getUserProfile();
      await _authRepository.saveUser(userEntity);
      emit(AuthAuthenticated(userEntity));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onAuthUploadUserPhoto(
    AuthUploadUserPhoto event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await _authRepository.uploadUserPhoto(event.imagePath);
      add(AuthGetUserProfile()); 
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onAuthLogout(AuthLogout event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    await _authRepository.removeAuthToken();
    emit(AuthUnauthenticated());
  }

  Future<void> _onAuthUpdateUserPhotoUrl(
    AuthUpdateUserPhotoUrl event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await _authRepository.updateUserProfilePhoto(event.photoUrl);
      add(AuthGetUserProfile()); 
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
