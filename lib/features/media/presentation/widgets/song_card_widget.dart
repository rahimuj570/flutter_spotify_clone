import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/core/configs/themes/app_colors.dart';
import 'package:flutter_spotify_clone/core/extensions/is_dark_mode_extension.dart';
import 'package:flutter_spotify_clone/features/common/presentation/widgets/overflow_aware_text.dart';
import 'package:flutter_spotify_clone/features/media/domain/entities/song_entity.dart';
import 'package:marquee/marquee.dart';

class SongCardWidget extends StatelessWidget {
  final SongEntity song;
  const SongCardWidget({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: .circular(18),
              child: CachedNetworkImage(
                imageUrl:
                    "https://spolify-spotify-clone.web.app/covers/${song.media}.jpg",
                fit: .fill,
                height: 185,
                width: 150,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: context.isDarkMode
                      ? AppColors.lightNavBarIconColor
                      : AppColors.grayTextOfCategoryTab,
                  shape: .circle,
                ),
                transform: Matrix4.translationValues(-8, 10, 0),
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: context.isDarkMode ? Colors.white : Colors.black,
                  size: 30,
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 10),
        SizedBox(
          width: 150,
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                song.title,
                overflow: .ellipsis,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              OverflowAwareText(
                text: song.artists,
                maxWidth: 150,
                // style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
    ;
  }
}
