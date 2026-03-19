import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/features/auth/domain/repositories/listen_history_repository.dart';
import 'package:flutter_spotify_clone/features/media/domain/entities/song_entity.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class GetListenHistoryUsecase {
  Future<Either<String, List<SongEntity>>> fetchListenHistorySongs() async {
    return getIt<ListenHistoryRepository>().fetchListenHistorySongs();
  }
}
