import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/core/configs/app_route.dart';
import 'package:flutter_spotify_clone/core/configs/themes/app_theme.dart';
import 'package:flutter_spotify_clone/presentation/pages/splash/splash_page.dart';
import 'package:flutter_spotify_clone/presentation/provider/choose_mode/theme_provider.dart';
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
      providers: [ChangeNotifierProvider(create: (context) => ThemeProvider())],
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
