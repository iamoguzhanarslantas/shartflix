import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String? id;
  final String? title;
  final String? description;
  final String? posterUrl;
  final String? releaseDate;
  final double? voteAverage;
  final bool? isFavorite;

  const MovieEntity({
    this.id,
    this.title,
    this.description,
    this.posterUrl,
    this.releaseDate,
    this.voteAverage,
    this.isFavorite,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        posterUrl,
        releaseDate,
        voteAverage,
        isFavorite,
      ];
}
