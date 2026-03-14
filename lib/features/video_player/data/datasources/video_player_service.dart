import 'package:flutter_spotify_clone/features/media/data/datasources/video_services.dart';
import 'package:flutter_spotify_clone/features/media/domain/entities/video_entity.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class VideoPlayerService {
  List<VideoEntity> _videos = getIt<VideoServices>().getVideos();

  List<VideoEntity> getRandomFourVideos(String mediaId) {
    List<VideoEntity> t = [];

    t = _videos.where((element) => element.mediaId != mediaId).toList();

    return t;
  }
}
