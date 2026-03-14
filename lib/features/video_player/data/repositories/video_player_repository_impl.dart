import 'package:flutter_spotify_clone/features/media/domain/entities/video_entity.dart';
import 'package:flutter_spotify_clone/features/video_player/data/datasources/video_player_service.dart';
import 'package:flutter_spotify_clone/features/video_player/domain/repositories/video_player_repository.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class VideoPlayerRepositoryImpl implements VideoPlayerRepository {
  @override
  List<VideoEntity> getRandomFourVideos({required String mediaId}) {
    return getIt<VideoPlayerService>().getRandomFourVideos(mediaId);
  }
}
