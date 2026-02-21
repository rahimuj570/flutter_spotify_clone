import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/core/configs/assets/app_images.dart';
import 'package:flutter_spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:flutter_spotify_clone/core/configs/themes/app_colors.dart';
import 'package:flutter_spotify_clone/presentation/widgets/get_started/hero_btn_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Spacer(),
                    Column(
                      children: [
                        SvgPicture.asset(AppVectors.moonIconPath),
                        Text('Dark Mode'),
                      ],
                    ),
                    SizedBox(width: 58),
                    Column(
                      children: [
                        SvgPicture.asset(AppVectors.sunIconPath),
                        Text('Light Mode'),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 68),
                HeroBtnWidget(action: () {}, title: 'Continue'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
