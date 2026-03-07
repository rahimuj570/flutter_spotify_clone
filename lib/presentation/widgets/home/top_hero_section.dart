import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/core/configs/assets/app_images.dart';
import 'package:flutter_spotify_clone/core/configs/themes/app_colors.dart';

class TopHeroSection extends StatelessWidget {
  const TopHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "New Album",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(color: Colors.white),
                    ),
                    Text(
                      "Happier Than Ever ",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge!.copyWith(color: Colors.white),
                    ),
                    Text(
                      "Billie Eilish",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              right: 20,
              child: Image.asset(AppImages.homeTopArtistImagePath, height: 170),
            ),
          ],
        ),
      ),
    );
  }
}
