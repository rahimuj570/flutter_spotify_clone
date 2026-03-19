import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/features/auth/data/datasources/listen_history_service.dart';
import 'package:flutter_spotify_clone/features/auth/domain/repositories/listen_history_repository.dart';
import 'package:flutter_spotify_clone/features/media/domain/entities/song_entity.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class ListenHistoryRepositoryImpl implements ListenHistoryRepository {
  @override
  Future<Either<String, List<SongEntity>>> fetchListenHistorySongs() async {
    return getIt<ListenHistoryService>().fetchListenHistorySongs();
  }
}
