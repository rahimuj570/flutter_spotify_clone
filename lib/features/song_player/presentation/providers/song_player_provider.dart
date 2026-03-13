import 'package:flutter/widgets.dart';
import 'package:just_audio/just_audio.dart';

class SongPlayerProvider extends ChangeNotifier {
  String _songId = "";
  String? _error = null;
  String? get getError => _error;

  final AudioPlayer _player = AudioPlayer();
  AudioPlayer get getAudioPlayer => _player;

  Duration? _songDuration;
  Duration? get getSongDuration => _songDuration;

  bool _isLoadingSong = false;
  bool get getIsLoadingSong => _isLoadingSong;

  Future<void> loadSong(String media) async {
    _error = null;
    if (_songId == media) {
      return;
    }
    try {
      _songId = media;
      _isLoadingSong = true;
      notifyListeners();

      _songDuration = await _player.setUrl(
        "https://spolify-spotify-clone.web.app/songs/$media.mp3",
      );
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoadingSong = false;
      notifyListeners();
    }
  }

  Future<void> playPauseSong() async {
    if (_player.playing) {
      await _player.pause();
    } else {
      _player.play();
    }
  }

  void seekSong(Duration position) {
    _player.seek(position);
  }

  void repeateOnOff() {
    if (_player.loopMode == LoopMode.off) {
      _player.setLoopMode(LoopMode.all);
    } else {
      _player.setLoopMode(LoopMode.off);
    }
    notifyListeners();
  }
}
