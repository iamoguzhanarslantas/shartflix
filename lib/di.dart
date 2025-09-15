import 'package:get_it/get_it.dart';
import 'package:shartflix/core/services/dio_client.dart';
import 'package:shartflix/data/repositories/i_remote_data_source.dart';
import 'package:shartflix/data/repositories/remote_data_source_impl.dart';
import 'package:shartflix/data/repositories/auth_repository_impl.dart';
import 'package:shartflix/data/repositories/movie_repository_impl.dart';
import 'package:shartflix/data/repositories/i_auth_repository.dart';
import 'package:shartflix/data/repositories/i_movie_repository.dart';
import 'package:shartflix/data/usecases/auth/get_user_profile.dart';
import 'package:shartflix/data/usecases/auth/login_user.dart';
import 'package:shartflix/data/usecases/auth/register_user.dart';
import 'package:shartflix/data/usecases/auth/upload_user_photo.dart';
import 'package:shartflix/data/usecases/movie/favorite_unfavorite_movie.dart';
import 'package:shartflix/data/usecases/movie/get_favorite_movie_list.dart';
import 'package:shartflix/data/usecases/movie/get_movie_list.dart';
import 'package:shartflix/presentation/cubits/auth/auth_bloc.dart'; 
import 'package:shartflix/presentation/cubits/movie/movie_cubit.dart';
import 'package:shartflix/presentation/cubits/favorite_movie/favorite_movie_cubit.dart';
import 'package:shartflix/core/services/local_storage_service.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton<LocalStorageService>(() => LocalStorageService());
  sl.registerLazySingleton<DioClient>(() => DioClient(sl()));

  // Data sources
  sl.registerLazySingleton<IRemoteDataSource>(() => RemoteDataSourceImpl(sl()));

  // Repositories
  sl.registerLazySingleton<IAuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl(), localStorageService: sl()),
  );
  sl.registerLazySingleton<IMovieRepository>(() => MovieRepositoryImpl(sl()));

  // Use cases - Auth
  sl.registerLazySingleton<LoginUser>(() => LoginUser(sl()));
  sl.registerLazySingleton<RegisterUser>(() => RegisterUser(sl()));
  sl.registerLazySingleton<GetUserProfile>(() => GetUserProfile(sl()));
  sl.registerLazySingleton<UploadUserPhoto>(() => UploadUserPhoto(sl()));

  // Use cases - Movie
  sl.registerLazySingleton<GetMovieList>(() => GetMovieList(sl()));
  sl.registerLazySingleton<GetFavoriteMovieList>(
    () => GetFavoriteMovieList(sl()),
  );
  sl.registerLazySingleton<FavoriteUnfavoriteMovie>(
    () => FavoriteUnfavoriteMovie(sl()),
  );

  // Blocs
  sl.registerFactory<AuthBloc>(() => AuthBloc(authRepository: sl()));
  sl.registerFactory<MovieCubit>(
    () => MovieCubit(
      getMovieList: sl(),
      getFavoriteMovieList: sl(),
      favoriteUnfavoriteMovie: sl(),
    ),
  );
  sl.registerFactory<FavoriteMovieCubit>(
    () => FavoriteMovieCubit(
      getFavoriteMovieList: sl(),
      favoriteUnfavoriteMovie: sl(),
    ),
  );
}
