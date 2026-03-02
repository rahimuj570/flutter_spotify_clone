import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/core/configs/app.dart';
import 'package:flutter_spotify_clone/firebase_options.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initilizedDependencies();

  runApp(const FlutterSpotifyClone());
}
