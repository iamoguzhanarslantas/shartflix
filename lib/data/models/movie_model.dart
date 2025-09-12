import 'package:flutter/foundation.dart'; // Import for debugPrint

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
    debugPrint('MovieModel.fromJson raw json: $json');
    final id = (json['id'] ?? json['_id'])?.toString(); // Ensure ID is a string
    final title = json['Title']?.toString() ?? 'No Title'; // Provide default
    final description = json['Plot']?.toString() ?? 'No Description'; // Provide default
    String? posterUrl;

    // Try to get posterUrl from different keys, prioritizing 'Images'
    if (json.containsKey('Images') && json['Images'] is List && json['Images'].isNotEmpty) {
      posterUrl = json['Images'][0]; // Take the first image from the 'Images' list
    } else if (json.containsKey('Poster')) {
      posterUrl = json['Poster'];
    } else if (json.containsKey('images')) {
      // Fallback for 'images' if it's not a list or if 'Images' was not present
      if (json['images'] is String) {
        posterUrl = json['images'];
      } else if (json['images'] is List && json['images'].isNotEmpty) {
        posterUrl = json['images'][0];
      } else if (json['images'] is Map && json['images'].containsKey('poster')) {
        posterUrl = json['images']['poster'];
      }
    } else if (json.containsKey('posterUrl')) {
      posterUrl = json['posterUrl'];
    }

    debugPrint('Poster URL (after key check, before cleaning): $posterUrl'); // Added for debugging

    // Attempt to fix malformed image URLs and filter out invalid ones
    if (posterUrl != null && posterUrl.startsWith('http')) {
      // Handle the '..jpg' case
      if (posterUrl.endsWith('..jpg')) {
        posterUrl = posterUrl.replaceAll('..jpg', '.jpg');
      }
      // Filter out common placeholder URLs
      if (posterUrl.toLowerCase() == 'n/a' || posterUrl.toLowerCase() == 'no poster') {
        posterUrl = null;
      }

      // Additional checks for potentially problematic URLs
      // Check for excessively long URLs (e.g., > 255 characters, a common limit)
      if (posterUrl != null && posterUrl.length > 255) {
        debugPrint('Poster URL too long, setting to null: $posterUrl');
        posterUrl = null;
      }
      // Add more aggressive filtering for known bad image patterns or very short/generic URLs
      if (posterUrl != null && (
          posterUrl.contains('no_image') ||
          posterUrl.contains('no-image') ||
          posterUrl.contains('placeholder') ||
          posterUrl.contains('default_poster') ||
          posterUrl.length < 10 || // Very short URLs are likely invalid
          posterUrl.contains('._V1_.jpg') && posterUrl.split(',').length > 1 // Filter out URLs with multiple commas in the path, often malformed
      )) {
        debugPrint('Poster URL contains problematic pattern or is too short/malformed, setting to null: $posterUrl');
        posterUrl = null;
      }
    } else {
      posterUrl = null; // If it doesn't start with http, it's likely invalid
    }
    final releaseDate = json['Released']?.toString();
    final voteAverage = double.tryParse(json['imdbRating']?.toString() ?? '') ?? 0.0;
    final isFavorite = json['isFavorite'] as bool? ?? false; // Ensure type safety and default to false

    debugPrint('Parsed MovieModel (after cleaning): id=$id, title=$title, description=$description, posterUrl=$posterUrl, releaseDate=$releaseDate, voteAverage=$voteAverage, isFavorite=$isFavorite');

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
