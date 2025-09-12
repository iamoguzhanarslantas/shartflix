import 'package:equatable/equatable.dart';
import 'package:shartflix/domain/entities/movie_entity.dart';

class MovieResponseEntity extends Equatable {
  final List<MovieEntity> movies;
  final int totalPages;
  final int currentPage;

  const MovieResponseEntity({
    required this.movies,
    required this.totalPages,
    required this.currentPage,
  });

  @override
  List<Object?> get props => [movies, totalPages, currentPage];
}
