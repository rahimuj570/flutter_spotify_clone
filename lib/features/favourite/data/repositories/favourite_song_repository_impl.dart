import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/features/favourite/data/datasources/favourite_service.dart';
import 'package:flutter_spotify_clone/features/favourite/domain/repositories/favourite_songs_repositories.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class FavouriteSongRepositoryImpl implements FavouriteSongRepositories {
  @override
  Future<Either<dynamic, dynamic>> fetchFavouriteSongs() async {
    return await getIt<FavouriteService>().fetchFavouriteSongs();
  }
}
