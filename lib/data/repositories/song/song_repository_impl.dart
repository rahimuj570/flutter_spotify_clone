import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/data/sources/song/songs_services.dart';
import 'package:flutter_spotify_clone/domain/repositories/song/song_repository.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class SongRepositoryImpl implements SongRepository {
  @override
  Future<Either<dynamic, dynamic>> getNewSongs() {
    return getIt<SongsServices>().getNewSongs();
  }
}
