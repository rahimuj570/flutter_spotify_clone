import 'package:flutter_spotify_clone/features/media/domain/entities/video_entity.dart';
import 'package:flutter_spotify_clone/features/media/domain/repositories/video_repository.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class GetVideosUsecase {
  List<VideoEntity> getVideos() {
    return getIt<VideoRepository>().getVideos();
  }
}
