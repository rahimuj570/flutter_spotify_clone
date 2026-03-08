import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:flutter_spotify_clone/presentation/pages/get_started/get_started_page.dart';
import 'package:flutter_spotify_clone/presentation/pages/root_page.dart';
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
    if (FirebaseAuth.instance.currentUser != null) {
      Navigator.pushReplacementNamed(context, RootPage.name);
    } else {
      Navigator.pushReplacementNamed(context, GetStartedPage.name);
    }
  }
}
