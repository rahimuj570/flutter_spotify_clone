import 'package:flutter_spotify_clone/features/media/domain/repositories/song_repository.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class GetIsInFavouriteSongUsecase {
  Future<bool> isInFavourite(String uId, String mediaId) {
    return getIt<SongRepository>().isInFavourite(uId, mediaId);
  }
}
