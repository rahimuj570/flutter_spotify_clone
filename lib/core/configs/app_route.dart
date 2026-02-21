import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/presentation/pages/get_started/get_started_page.dart';
import 'package:flutter_spotify_clone/presentation/pages/splash/splash_page.dart';

class AppRoute {
  static Route<dynamic>? genearateRoute(RouteSettings settings) {
    Widget widget = Placeholder();

    if (settings.name == SplashPage.name) {
      widget = SplashPage();
    } else if (settings.name == GetStartedPage.name) {
      widget = GetStartedPage();
    }

    return MaterialPageRoute(builder: (context) => widget);
  }
}
