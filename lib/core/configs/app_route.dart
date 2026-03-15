import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/features/auth/presentation/pages/signin_page.dart';
import 'package:flutter_spotify_clone/features/auth/presentation/pages/signup_or_signin_page.dart';
import 'package:flutter_spotify_clone/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter_spotify_clone/features/choose_mode/presentation/pages/choose_mode_page.dart';
import 'package:flutter_spotify_clone/features/get_started/presentation/pages/get_started_page.dart';
import 'package:flutter_spotify_clone/features/home/presentation/pages/home_page.dart';
import 'package:flutter_spotify_clone/features/media/domain/entities/song_entity.dart';
import 'package:flutter_spotify_clone/features/song_player/presentation/pages/song_player_page.dart';
import 'package:flutter_spotify_clone/features/splash/presentation/pages/splash_page.dart';

class AppRoute {
  static Route<dynamic>? genearateRoute(RouteSettings settings) {
    Widget widget;
    switch (settings.name) {
      case SplashPage.name:
        widget = SplashPage();
        break;
      case ChooseModePage.name:
        widget = ChooseModePage();
        break;
      case GetStartedPage.name:
        widget = GetStartedPage();
        break;
      case SignupOrSigninPage.name:
        widget = SignupOrSigninPage();
        break;
      case SigninPage.name:
        widget = SigninPage();
        break;
      case SignupPage.name:
        widget = SignupPage();
        break;
      case HomePage.name:
        widget = HomePage();
        break;
      case SongPlayerPage.name:
        {
          Map<dynamic, dynamic> args =
              settings.arguments as Map<dynamic, dynamic>;
          SongEntity songEntity = args['songEntity'] as SongEntity;
          int index = args['index'] as int;
          bool isFromFirstThreeSection =
              args['isFromFirstThreeSection'] as bool;
          widget = SongPlayerPage(
            songEntity: songEntity,
            index: index,
            isFromTopThreeSection: isFromFirstThreeSection,
          );
          break;
        }

      default:
        widget = Placeholder();
    }
    return MaterialPageRoute(builder: (context) => widget);
  }
}
