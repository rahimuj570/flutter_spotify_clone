import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/common/extensions/is_dark_mode_extension.dart';
import 'package:flutter_spotify_clone/common/widgets/common_appbar.dart';
import 'package:flutter_spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupOrSigninPage extends StatelessWidget {
  static const String name = '/signup_or_signin';
  const SignupOrSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLeadingSearch = true;
    bool titleShow = true;
    bool actionMenuShow = true;

    return Scaffold(
      appBar: CommonAppbar(
        titleShow: false,
        isLeadingSearch: false,
        actionMenuShow: false,
      ),
      body: Stack(),
    );
  }
}
