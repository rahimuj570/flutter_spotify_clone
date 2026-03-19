import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/features/auth/data/datasources/auth_firebase_service.dart';
import 'package:flutter_spotify_clone/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_spotify_clone/service_locator.dart';
import 'package:just_audio/just_audio.dart';

class SongPlayerService {
  final AudioPlayer _player = AudioPlayer();

  AudioPlayer get getAudioPlayer => _player;

  ///Load song by passing media name
  Future<Either> loadSong(String media) async {
    try {
      return Right(
        await _player.setUrl(
          "https://spolify-spotify-clone.web.app/songs/$media.mp3",
        ),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<dynamic, bool>> playPauseSong() async {
    try {
      if (_player.playing) {
        await _player.pause();
        return Right(false);
      } else {
        _player.play();
        return Right(true);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<void> seekSong(Duration position) async {
    await _player.seek(position);
  }

  bool repeateOnOff() {
    if (_player.loopMode == LoopMode.off) {
      _player.setLoopMode(LoopMode.all);
      return true;
    } else {
      _player.setLoopMode(LoopMode.off);
      return false;
    }
  }

  void forwardBackward({required bool isForward}) async {
    Duration current = _player.position;
    Duration total = _player.duration ?? Duration.zero;
    if (isForward) {
      Duration newPosition = current + const Duration(seconds: 10);
      await _player.seek(newPosition > total ? total : newPosition);
    } else {
      Duration newPosition = current - const Duration(seconds: 10);
      await _player.seek(
        newPosition < Duration.zero ? Duration.zero : newPosition,
      );
    }
  }

  Stream<PlayerState> getPlayerStateStream() {
    return _player.playerStateStream;
  }

  Stream<Duration> getPositionStream() {
    return _player.positionStream;
  }

  Duration getBufferPosition() {
    return _player.bufferedPosition;
  }

  Duration getCurrentPosition() {
    return _player.position;
  }

  Future<void> stopSong() async {
    await _player.stop();
  }

  Future<Either<String, bool>> addToHistory(String mediaId) async {
    UserEntity user = getIt<AuthFirebaseService>().getUser()!;
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.email)
          .collection('histories')
          .doc(mediaId)
          .set({'mediaId': mediaId, 'timeStamp': Timestamp.now()});
      return Right(true);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
