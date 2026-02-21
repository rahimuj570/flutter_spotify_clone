import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/core/configs/themes/app_theme.dart';
import 'package:flutter_spotify_clone/presentation/pages/splash/splash_page.dart';

class FlutterSpotifyClone extends StatefulWidget {
  const FlutterSpotifyClone({super.key});

  @override
  State<FlutterSpotifyClone> createState() => _FlutterSpotifyCloneState();
}

class _FlutterSpotifyCloneState extends State<FlutterSpotifyClone> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      home: SplashPage(),
    );
  }
}
