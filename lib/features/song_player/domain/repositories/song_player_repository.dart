import 'package:dartz/dartz.dart';
import 'package:just_audio/just_audio.dart';

abstract class SongPlayerRepository {
  Future<Either> loadSong(String media);
  Future<Either<dynamic, bool>> playPauseSong();
  Future<void> seekSong({required Duration position});
  bool repeateOnOff();
  Future<void> forwardBackward({required bool isForward});

  Stream<PlayerState> getPlayerStateStream();
  Stream<Duration> getPositionStream();
  Duration getBufferPosition();
}
