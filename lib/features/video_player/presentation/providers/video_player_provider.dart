import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/features/media/domain/entities/video_entity.dart';
import 'package:flutter_spotify_clone/features/video_player/domain/usecases/get_random_four_videos_usecase.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class VideoPlayerProvider extends ChangeNotifier {
  List<VideoEntity> _randomFourVideos = [];

  List<VideoEntity> get getRandomFourVideos => _randomFourVideos;

  void fetchRandomFourVideos({required String mediaId}) {
    _randomFourVideos = getIt<GetRandomFourVideosUsecase>().getRandomFourVideos(
      mediaId: mediaId,
    );
  }
}
