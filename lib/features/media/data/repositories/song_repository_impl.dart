import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/features/media/data/datasources/song_services.dart';
import 'package:flutter_spotify_clone/features/media/domain/repositories/song_repository.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class SongRepositoryImpl implements SongRepository {
  @override
  Future<Either<dynamic, dynamic>> getNewSongs() {
    return getIt<SongServices>().getNewSongs();
  }
}
