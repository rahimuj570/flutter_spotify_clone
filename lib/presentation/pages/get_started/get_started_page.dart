import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/core/configs/assets/app_images.dart';
import 'package:flutter_spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:flutter_spotify_clone/core/configs/themes/app_colors.dart';
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
                fit: BoxFit.fill,
                image: AssetImage(AppImages.introBgPath),
              ),
            ),
          ),

          Container(color: Colors.black.withValues(alpha: .15)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 53, vertical: 69),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppVectors.logoPath),
                ),
                Spacer(),
                const Text(
                  'Enjoy listening to music',
                  style: TextStyle(
                    color: AppColors.lightTextColor,
                    fontSize: 25,
                    fontWeight: .bold,
                  ),
                ),
                SizedBox(height: 21),
                const Text(
                  "Your music, your vibe, your world. Discover millions of tracks instantly. Press play and feel the rhythm.",
                  textAlign: .center,
                  style: TextStyle(
                    fontSize: 17,
                    color: AppColors.lightNavBarIconColor,
                  ),
                ),
                SizedBox(height: 38),

                HeroBtnWidget(action: _onClickGEtStarted, title: 'Get Started'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onClickGEtStarted() {
    print('object');
  }
}
