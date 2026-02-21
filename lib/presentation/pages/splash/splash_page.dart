import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:flutter_spotify_clone/presentation/pages/get_started/get_started_page.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatefulWidget {
  static const name = "/splash";
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _goToGetStarted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: SvgPicture.asset(AppVectors.logoPath)));
  }

  void _goToGetStarted() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, GetStartedPage.name);
  }
}
