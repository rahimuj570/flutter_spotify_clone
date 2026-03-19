import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/features/media/domain/entities/song_entity.dart';

abstract class ListenHistoryRepository {
  Future<Either<String, List<SongEntity>>> fetchListenHistorySongs();
}
