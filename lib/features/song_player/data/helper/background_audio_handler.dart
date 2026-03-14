import 'package:audio_service/audio_service.dart';
import 'package:flutter_spotify_clone/features/song_player/data/datasources/song_player_service.dart';
import 'package:just_audio/just_audio.dart';

class BackgroundAudioHandler extends BaseAudioHandler
    with QueueHandler, SeekHandler {
  final SongPlayerService _service;

  BackgroundAudioHandler(this._service) {
    _service.getAudioPlayer.playbackEventStream
        .map(_transformEvent)
        .pipe(playbackState);
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

  PlaybackState _transformEvent(PlaybackEvent event) {
    final player = _service.getAudioPlayer;

    return PlaybackState(
      controls: [
        MediaControl.rewind,
        player.playing ? MediaControl.pause : MediaControl.play,
        MediaControl.fastForward,
        MediaControl.stop,
      ],
      androidCompactActionIndices: const [0, 1, 2],
      playing: player.playing,
      processingState: {
        ProcessingState.idle: AudioProcessingState.idle,
        ProcessingState.loading: AudioProcessingState.loading,
        ProcessingState.buffering: AudioProcessingState.buffering,
        ProcessingState.ready: AudioProcessingState.ready,
        ProcessingState.completed: AudioProcessingState.completed,
      }[player.processingState]!,
      updateTime: event.updateTime, // 🔑 timestamp
      updatePosition: event.updatePosition, // 🔑 current position
      bufferedPosition: event.bufferedPosition, // 🔑 buffer progress
      speed: player.playing
          ? player.speed
          : 0.0, // 🔑 1.0 when playing, 0.0 when paused
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

  @override
  Future<void> stop() async {
    await _service.stopSong();
  }
}
