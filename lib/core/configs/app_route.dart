import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/presentation/pages/auth/signup_or_signin_page.dart';
import 'package:flutter_spotify_clone/presentation/pages/choose_mode/choose_mode_page.dart';
import 'package:flutter_spotify_clone/presentation/pages/get_started/get_started_page.dart';
import 'package:flutter_spotify_clone/presentation/pages/splash/splash_page.dart';

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
      default:
        widget = Placeholder();
    }
    return MaterialPageRoute(builder: (context) => widget);
  }
}
