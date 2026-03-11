import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/core/extensions/is_dark_mode_extension.dart';
import 'package:flutter_spotify_clone/features/common/presentation/widgets/common_appbar.dart';
import 'package:flutter_spotify_clone/core/configs/assets/app_images.dart';
import 'package:flutter_spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:flutter_spotify_clone/features/auth/presentation/pages/signin_page.dart';
import 'package:flutter_spotify_clone/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupOrSigninPage extends StatelessWidget {
  static const String name = '/signup_or_signin';
  const SignupOrSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CommonAppbar(
        titleShow: false,
        isLeadingSearch: false,
        actionMenuShow: false,
      ),
      body: Stack(
        children: [
          Align(
            alignment: .topRight,
            child: SvgPicture.asset(AppVectors.topRightPattern),
          ),
          Align(
            alignment: .bottomLeft,
            child: Image.asset(AppImages.authImagePath, width: 330),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  SvgPicture.asset(AppVectors.logoPath),
                  SizedBox(height: 58),
                  Text(
                    "Enjoy listening to music",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 21),
                  Text(
                    "Spotify is a proprietary Swedish audio streaming and media services provider",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 30),
                  Row(
                    spacing: 30,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, SignupPage.name);
                          },
                          child: Text('Register'),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SigninPage.name);
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: .w500,
                            color: context.isDarkMode ? Colors.white : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: .bottomRight,
            child: SvgPicture.asset(AppVectors.bottomRightPattern, width: 130),
          ),
        ],
      ),
    );
  }
}
