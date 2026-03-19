import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/core/configs/themes/app_colors.dart';
import 'package:flutter_spotify_clone/core/extensions/is_dark_mode_extension.dart';
import 'package:flutter_spotify_clone/features/media/domain/entities/song_entity.dart';

class CustomListTileWidget extends StatelessWidget {
  const CustomListTileWidget({
    super.key,
    required this.moreSongList,
    required this.index,
    required this.provider,
  });

  final List<SongEntity> moreSongList;
  final int index;
  final dynamic provider;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'topThreeSong${moreSongList[index].media}',
      child: Material(
        type: .transparency,
        child: ListTile(
          title: Text(moreSongList[index].title),
          subtitle: Text(moreSongList[index].artists),
          leading: Container(
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
          trailing: Row(
            mainAxisSize: .min,
            children: [
              Text(
                moreSongList[index].duration.toString(),
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(width: 20),
              IconButton(
                onPressed: () {
                  provider.addOrRemoveFavourite(
                    moreSongList[index].media,
                    index,
                  );
                },
                icon: Icon(
                  moreSongList[index].isInFavourite ?? false
                      ? Icons.favorite_rounded
                      : Icons.favorite_border,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
