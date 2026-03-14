import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/features/media/domain/entities/video_entity.dart';
import 'package:flutter_spotify_clone/features/media/domain/usecases/get_videos_usecase.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class VideoProvider extends ChangeNotifier {
  List<VideoEntity> _videos = [];
  List<VideoEntity> get getVideos => _videos;

  void fetchVideos() {
    _videos = getIt<GetVideosUsecase>().getVideos();
  }
}
