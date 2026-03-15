import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/features/media/domain/repositories/song_repository.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class AddOrRemoveFavouriteUsecase {
  ///Return true on Right if added else returning false
  Future<Either<String, bool>> addOrRemoveFavourite(String mediaId) {
    return getIt<SongRepository>().addOrRemoveFavourite(mediaId);
  }
}
