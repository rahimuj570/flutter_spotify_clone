import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/core/configs/assets/app_images.dart';
import 'package:flutter_spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:flutter_spotify_clone/core/configs/themes/app_colors.dart';
import 'package:flutter_spotify_clone/presentation/pages/auth/signup_or_signin_page.dart';
import 'package:flutter_spotify_clone/presentation/provider/choose_mode/theme_provider.dart';
import 'package:flutter_spotify_clone/presentation/widgets/get_started/hero_btn_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ChooseModePage extends StatefulWidget {
  static const String name = '/choose_mode';
  const ChooseModePage({super.key});

  @override
  State<ChooseModePage> createState() => _ChooseModePageState();
}

class _ChooseModePageState extends State<ChooseModePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppImages.chooseModeBfPath),
              ),
            ),
          ),

          Container(color: Colors.black.withValues(alpha: .65)),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 31, vertical: 70),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppVectors.logoPath),
                ),
                Spacer(),
                Text(
                  'Choose mode',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.lightTextColor,
                  ),
                ),
                SizedBox(height: 53),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Column(
                      spacing: 8,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.read<ThemeProvider>().changeThemeMode(
                              isDark: true,
                            );
                          },
                          child: ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: .1),
                                  shape: BoxShape.circle,
                                ),
                                height: 80,
                                width: 80,
                                child: SvgPicture.asset(
                                  fit: BoxFit.none,
                                  AppVectors.moonIconPath,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Dark Mode',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),

                    SizedBox(width: 40),

                    Column(
                      spacing: 8,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.read<ThemeProvider>().changeThemeMode(
                              isDark: false,
                            );
                          },
                          child: ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: .1),
                                  shape: BoxShape.circle,
                                ),
                                height: 80,
                                width: 80,
                                child: SvgPicture.asset(
                                  fit: BoxFit.none,
                                  AppVectors.sunIconPath,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Light Mode',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 68),
                HeroBtnWidget(
                  action: () {
                    Navigator.pushNamed(context, SignupOrSigninPage.name);
                  },
                  title: 'Continue',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
