import 'package:flutter/widgets.dart';
import 'package:flutter_spotify_clone/features/song_player/domain/usecases/song_control_usecase.dart';
import 'package:flutter_spotify_clone/service_locator.dart';
import 'package:just_audio/just_audio.dart';

class SongPlayerProvider extends ChangeNotifier {
  String _songId = "";
  String? _loadError;
  String? get getLoadError => _loadError;

  Duration? _songDuration;
  Duration? get getSongDuration => _songDuration;

  bool _isLoadingSong = false;
  bool get getIsLoadingSong => _isLoadingSong;

  SongControlUsecase usecase = getIt<SongControlUsecase>();

  Future<void> loadSong(String media) async {
    _loadError = null;
    if (_songId == media) {
      return;
    }
    _songId = media;
    _isLoadingSong = true;
    notifyListeners();

    var res = await usecase.loadSong(media: media);
    res.fold((l) => _loadError = l, (r) => _songDuration = r);

    _isLoadingSong = false;
    notifyListeners();
  }

  String? _playError;
  String? get getPlayError => _playError;
  bool _isPlaying = false;
  bool get getIsPlaying => _isPlaying;

  Future<void> playPauseSong() async {
    _playError = null;
    var res = await usecase.playPauseSong();
    res.fold((l) => _playError = l, (r) => _isPlaying = r);
    notifyListeners();
  }

  Future<void> seekSong(Duration position) async {
    await usecase.seekSong(position: position);
    notifyListeners();
  }

  bool _isRepeating = false;
  bool get getIsRepeating => _isRepeating;

  void repeateOnOff() {
    _isRepeating = usecase.repeateOnOff();
    notifyListeners();
  }

  void forwardBackward({required bool isForward}) async {
    await usecase.forwardBackward(isForward: isForward);
    notifyListeners();
  }

  Stream<PlayerState> get getPlayerStateStream =>
      usecase.getPlayerStateStream();

  Stream<Duration> get getPositionStream => usecase.getPositionStream();

  Duration get getBufferPosition => usecase.getBufferPosition();
}
