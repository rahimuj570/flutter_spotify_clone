import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/core/configs/app.dart';
import 'package:flutter_spotify_clone/features/song_player/data/datasources/song_player_service.dart';
import 'package:flutter_spotify_clone/features/song_player/data/helper/background_audio_handler.dart';
import 'package:flutter_spotify_clone/firebase_options.dart';
import 'package:flutter_spotify_clone/service_locator.dart';
import 'package:get_it/get_it.dart';

void main() async {
  BackgroundAudioHandler audioHandler;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initilizedDependencies();

  final session = await AudioSession.instance;
  await session.configure(AudioSessionConfiguration.music());

  GetIt.instance.registerSingleton<BackgroundAudioHandler>(
    await AudioService.init(
      builder: () => BackgroundAudioHandler(getIt<SongPlayerService>()),
      config: const AudioServiceConfig(
        androidNotificationChannelId: 'com.example.audio.channel',
        androidNotificationChannelName: 'Audio playback',
        androidNotificationOngoing: true,
      ),
    ),
  );

  runApp(const FlutterSpotifyClone());
}
