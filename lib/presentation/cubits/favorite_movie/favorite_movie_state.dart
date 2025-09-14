part of 'favorite_movie_cubit.dart';

abstract class FavoriteMovieState extends Equatable {
  const FavoriteMovieState();

  @override
  List<Object> get props => [];
}

class FavoriteMovieInitial extends FavoriteMovieState {}

class FavoriteMovieLoading extends FavoriteMovieState {}

class FavoriteMovieLoaded extends FavoriteMovieState {
  final List<MovieEntity> movies;

  const FavoriteMovieLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class FavoriteMovieError extends FavoriteMovieState {
  final Failure failure;

  const FavoriteMovieError(this.failure);

  @override
  List<Object> get props => [failure];
}
