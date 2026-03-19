import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/features/song_player/data/datasources/song_player_service.dart';
import 'package:flutter_spotify_clone/features/song_player/domain/repositories/song_player_repository.dart';
import 'package:flutter_spotify_clone/service_locator.dart';
import 'package:just_audio/just_audio.dart';

class SongPlayerRepositoryImpl implements SongPlayerRepository {
  SongPlayerService service = getIt<SongPlayerService>();

  @override
  Future<void> forwardBackward({required bool isForward}) async {
    service.forwardBackward(isForward: isForward);
  }

  @override
  Future<Either<dynamic, dynamic>> loadSong(String media) async {
    return await service.loadSong(media);
  }

  @override
  Future<Either<dynamic, bool>> playPauseSong() async {
    return await service.playPauseSong();
  }

  @override
  bool repeateOnOff() {
    return service.repeateOnOff();
  }

  @override
  Future<void> seekSong({required Duration position}) async {
    await service.seekSong(position);
  }

  @override
  Duration getBufferPosition() {
    return service.getBufferPosition();
  }

  @override
  Stream<PlayerState> getPlayerStateStream() {
    return service.getPlayerStateStream();
  }

  @override
  Stream<Duration> getPositionStream() {
    return service.getPositionStream();
  }

  @override
  Future<Either<String, bool>> addToHistory(String mediaId) {
    return getIt<SongPlayerService>().addToHistory(mediaId);
  }
}
