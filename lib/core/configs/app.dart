import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/core/configs/app_route.dart';
import 'package:flutter_spotify_clone/core/configs/themes/app_theme.dart';
import 'package:flutter_spotify_clone/features/media/presentation/provders/new_song_provider.dart';
import 'package:flutter_spotify_clone/features/song_player/presentation/providers/song_player_provider.dart';
import 'package:flutter_spotify_clone/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter_spotify_clone/features/auth/presentation/providers/signin_provider.dart';
import 'package:flutter_spotify_clone/features/auth/presentation/providers/signup_provider.dart';
import 'package:flutter_spotify_clone/features/choose_mode/presentation/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class FlutterSpotifyClone extends StatefulWidget {
  const FlutterSpotifyClone({super.key});

  @override
  State<FlutterSpotifyClone> createState() => _FlutterSpotifyCloneState();
}

class _FlutterSpotifyCloneState extends State<FlutterSpotifyClone> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => SignupProvider()),
        ChangeNotifierProvider(create: (context) => SigninProvider()),
        ChangeNotifierProvider(create: (context) => NewSongProvider()),
        ChangeNotifierProvider(create: (context) => SongPlayerProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          themeProvider.fetchSavedTheme();
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme(),
            darkTheme: AppTheme.darkTheme(),
            themeMode: themeProvider.getThemeMode,
            onGenerateRoute: (settings) => AppRoute.genearateRoute(settings),
            initialRoute: SplashPage.name,
          );
        },
      ),
    );
  }
}
