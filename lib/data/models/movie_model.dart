import 'package:shartflix/data/entities/movie_entity.dart';

class MovieModel {
  final String? id;
  final String? title;
  final String? description;
  final List<String>? images;
  final String? releaseDate;
  final double? voteAverage;
  final bool? isFavorite;

  MovieModel({
    this.id,
    this.title,
    this.description,
    this.images,
    this.releaseDate,
    this.voteAverage,
    this.isFavorite,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    final id = (json['id'] ?? json['_id'])?.toString(); // Ensure ID is a string
    final title = json['Title']?.toString() ?? 'No Title'; // Provide default
    final description =
        json['Plot']?.toString() ?? 'No Description'; // Provide default
    final List<String> images =
        (json['Images'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .where(
              (url) =>
                  url.startsWith('http') &&
                  url.length > 10 &&
                  !url.contains('no_image') &&
                  !url.contains('placeholder'),
            )
            .toList() ??
        [];

    final releaseDate = json['Released']?.toString();
    final voteAverage =
        double.tryParse(json['imdbRating']?.toString() ?? '') ?? 0.0;
    final isFavorite =
        json['isFavorite'] as bool? ??
        false; // Ensure type safety and default to false

    return MovieModel(
      id: id,
      title: title,
      description: description,
      images: images,
      releaseDate: releaseDate,
      voteAverage: voteAverage,
      isFavorite: isFavorite,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'images': images,
      'releaseDate': releaseDate,
      'voteAverage': voteAverage,
      'isFavorite': isFavorite,
    };
  }

  MovieEntity toEntity() {
    return MovieEntity(
      id: id,
      title: title,
      description: description,
      images: images,
      releaseDate: releaseDate,
      voteAverage: voteAverage,
      isFavorite: isFavorite,
    );
  }
}
