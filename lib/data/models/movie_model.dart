class MovieModel {
  final String? id;
  final String? title;
  final String? description;
  final String? posterUrl;
  final String? releaseDate;
  final double? voteAverage;
  final bool? isFavorite;

  MovieModel({
    this.id,
    this.title,
    this.description,
    this.posterUrl,
    this.releaseDate,
    this.voteAverage,
    this.isFavorite,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    print('MovieModel.fromJson raw json: $json');
    final id = json['id'] ?? json['_id'];
    final title = json['Title'];
    final description = json['Plot'];
    final posterUrl = json['Poster'];
    final releaseDate = json['Released'];
    final voteAverage = double.tryParse(json['imdbRating']?.toString() ?? '') ?? 0.0;
    final isFavorite = json['isFavorite'] ?? false; // Default to false if not provided

    print('Parsed MovieModel: id=$id, title=$title, description=$description, posterUrl=$posterUrl, releaseDate=$releaseDate, voteAverage=$voteAverage, isFavorite=$isFavorite');

    return MovieModel(
      id: id,
      title: title,
      description: description,
      posterUrl: posterUrl,
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
      'posterUrl': posterUrl,
      'releaseDate': releaseDate,
      'voteAverage': voteAverage,
      'isFavorite': isFavorite,
    };
  }
}
