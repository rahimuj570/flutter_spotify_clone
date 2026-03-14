import 'package:flutter_spotify_clone/features/media/domain/entities/video_entity.dart';

abstract class VideoPlayerRepository {
  List<VideoEntity> getRandomFourVideos({required String mediaId});
}
