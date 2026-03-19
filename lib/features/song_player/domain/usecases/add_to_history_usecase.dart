import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/features/song_player/domain/repositories/song_player_repository.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class AddToHistoryUsecase {
  ///Return true on Right if added else returning false
  Future<Either<String, bool>> addtoHistory(String mediaId) {
    return getIt<SongPlayerRepository>().addToHistory(mediaId);
  }
}
