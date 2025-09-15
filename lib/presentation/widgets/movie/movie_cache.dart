import 'package:flutter/material.dart';
import 'dart:developer';


class MovieCache {
  final BuildContext context;

  MovieCache(this.context);

  Future<void> precacheNextImage(String imageUrl) async {
    if (imageUrl.isEmpty) return;

    try {
      await precacheImage(
        NetworkImage(imageUrl),
        context,
        onError: (exception, stackTrace) {
          if (exception.toString().contains('404')) {
            log('Image not found (404) for: $imageUrl', name: 'HomePage');
          } else {
            log(
              'Network Image Load Exception for: $imageUrl\nError: $exception',
              error: exception,
              stackTrace: stackTrace,
              name: 'HomePage',
            );
          }
        },
      );
    } catch (e, st) {
      log(
        'Precache image failed for: $imageUrl\nError: $e',
        error: e,
        stackTrace: st,
        name: 'HomePage',
      );
    }
  }  
}
