import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/core/configs/assets/app_images.dart';
import 'package:flutter_spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:flutter_spotify_clone/core/configs/themes/app_colors.dart';
import 'package:flutter_spotify_clone/presentation/pages/choose_mode/choose_mode_page.dart';
import 'package:flutter_spotify_clone/presentation/widgets/get_started/hero_btn_widget.dart';
import 'package:flutter_svg/svg.dart';

class GetStartedPage extends StatelessWidget {
  static const name = "/get_started";
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppImages.introBgPath),
              ),
            ),
          ),

          Container(color: Colors.black.withValues(alpha: .8)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 53, vertical: 69),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppVectors.logoPath),
                ),
                Spacer(),
                Text(
                  'Enjoy listening to music',
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium!.copyWith(color: Colors.white),
                ),
                SizedBox(height: 21),
                Text(
                  "Your music, your vibe, your world. Discover millions of tracks instantly. Press play and feel the rhythm.",
                  textAlign: .center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.lightNavBarIconColor,
                  ),
                ),
                SizedBox(height: 38),

                HeroBtnWidget(
                  action: () => _onClickGetStarted(context),
                  title: 'Get Started',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onClickGetStarted(BuildContext context) {
    Navigator.pushReplacementNamed(context, ChooseModePage.name);
  }
}
