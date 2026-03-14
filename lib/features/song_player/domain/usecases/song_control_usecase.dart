import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/features/song_player/domain/repositories/song_player_repository.dart';
import 'package:flutter_spotify_clone/service_locator.dart';
import 'package:just_audio/just_audio.dart';

class SongControlUsecase {
  SongPlayerRepository repository = getIt<SongPlayerRepository>();

  Future<Either> loadSong({required String media}) async {
    return await repository.loadSong(media);
  }

  Future<Either<dynamic, bool>> playPauseSong() async {
    return repository.playPauseSong();
  }

  Future<void> seekSong({required Duration position}) async {
    await repository.seekSong(position: position);
  }

  bool repeateOnOff() {
    return repository.repeateOnOff();
  }

  Future<void> forwardBackward({required bool isForward}) async {
    await repository.forwardBackward(isForward: isForward);
  }

  Stream<PlayerState> getPlayerStateStream() {
    return repository.getPlayerStateStream();
  }

  Stream<Duration> getPositionStream() {
    return repository.getPositionStream();
  }

  Duration getBufferPosition() {
    return repository.getBufferPosition();
  }
}
