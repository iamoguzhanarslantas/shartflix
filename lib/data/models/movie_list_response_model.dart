import 'package:shartflix/data/models/movie_model.dart';

class MovieListResponseModel {
  final List<MovieModel> movies;
  final int totalPages;
  final int currentPage;

  MovieListResponseModel({
    required this.movies,
    required this.totalPages,
    required this.currentPage,
  });

  factory MovieListResponseModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>?;
    final pagination = data?['pagination'] as Map<String, dynamic>?;
    return MovieListResponseModel(
      movies:
          (data?['movies'] as List?)
              ?.map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [], 
      totalPages:
          pagination?['maxPage'] as int? ?? 0, 
      currentPage:
          pagination?['currentPage'] as int? ?? 0, 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'movies': movies.map((e) => e.toJson()).toList(),
      'totalPages': totalPages,
      'currentPage': currentPage,
    };
  }
}
