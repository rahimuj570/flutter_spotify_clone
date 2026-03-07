import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/presentation/pages/home/home_page.dart';

class RootPage extends StatelessWidget {
  static const String name = "/root_page";
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
