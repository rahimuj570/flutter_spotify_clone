import 'package:flutter_spotify_clone/features/media/data/datasources/video_services.dart';
import 'package:flutter_spotify_clone/features/media/domain/entities/video_entity.dart';
import 'package:flutter_spotify_clone/features/media/domain/repositories/video_repository.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class VideoRepositoryImpl implements VideoRepository {
  @override
  List<VideoEntity> getVideos() {
    return getIt<VideoServices>().getVideos();
  }
}
