import 'package:audio_service/audio_service.dart';
import 'package:flutter_spotify_clone/features/song_player/data/datasources/song_player_service.dart';
import 'package:just_audio/just_audio.dart';

class BackgroundAudioHandler extends BaseAudioHandler
    with QueueHandler, SeekHandler {
  final SongPlayerService _service;

  BackgroundAudioHandler(this._service) {
    _service.getPlayerStateStream().map(_transformEvent).pipe(playbackState);
  }

  Future<void> loadSong(
    String url, {
    required String title,
    required String artist,
    required String media,
  }) async {
    final item = MediaItem(
      id: url,
      title: title,
      artist: artist,
      artUri: Uri.parse(
        "https://spolify-spotify-clone.web.app/covers/$media.jpg",
      ),
    );

    mediaItem.add(item);
  }

  PlaybackState _transformEvent(PlayerState state) {
    return PlaybackState(
      controls: [
        MediaControl.rewind,
        state.playing ? MediaControl.pause : MediaControl.play,
        MediaControl.fastForward,
      ],
      androidCompactActionIndices: const [0, 1, 2],
      playing: state.playing,
      processingState: {
        ProcessingState.idle: AudioProcessingState.idle,
        ProcessingState.loading: AudioProcessingState.loading,
        ProcessingState.buffering: AudioProcessingState.buffering,
        ProcessingState.ready: AudioProcessingState.ready,
        ProcessingState.completed: AudioProcessingState.completed,
      }[state.processingState]!,
      updateTime: DateTime.now(),
      updatePosition: _service.getCurrentPosition(),
      bufferedPosition: _service.getBufferPosition(),
    );
  }

  @override
  Future<void> play() => _service.playPauseSong();
  @override
  Future<void> pause() => _service.playPauseSong();
  @override
  Future<void> seek(Duration position) => _service.seekSong(position);
  @override
  Future<void> fastForward() async {
    _service.forwardBackward(isForward: true);
  }

  @override
  Future<void> rewind() async {
    _service.forwardBackward(isForward: false);
  }
}
