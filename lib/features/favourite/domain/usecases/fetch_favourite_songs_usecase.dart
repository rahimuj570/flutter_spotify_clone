import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/features/favourite/domain/repositories/favourite_songs_repositories.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class FetchFavouriteSongsUsecase {
  Future<Either> fetchFavouriteSongs() async {
    return getIt<FavouriteSongRepositories>().fetchFavouriteSongs();
  }
}
