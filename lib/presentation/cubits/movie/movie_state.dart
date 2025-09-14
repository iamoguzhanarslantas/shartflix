part of 'movie_cubit.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final MovieResponseEntity movieResponse;

  const MovieLoaded(this.movieResponse);

  @override
  List<Object> get props => [movieResponse];
}

class MovieError extends MovieState {
  final Failure failure;

  const MovieError(this.failure);

  @override
  List<Object> get props => [failure];
}
