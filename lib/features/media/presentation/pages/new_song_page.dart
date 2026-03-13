import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/core/configs/themes/app_colors.dart';
import 'package:flutter_spotify_clone/core/extensions/is_dark_mode_extension.dart';
import 'package:flutter_spotify_clone/core/helper/show_snackbar.dart';
import 'package:flutter_spotify_clone/features/media/domain/entities/song_entity.dart';
import 'package:flutter_spotify_clone/features/media/presentation/provders/new_song_provider.dart';
import 'package:flutter_spotify_clone/features/media/presentation/widgets/song_card_widget.dart';
import 'package:flutter_spotify_clone/features/song_player/presentation/pages/song_player_page.dart';
import 'package:provider/provider.dart';

class NewSongPage extends StatefulWidget {
  const NewSongPage({super.key});

  @override
  State<NewSongPage> createState() => _NewSongPageState();
}

class _NewSongPageState extends State<NewSongPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (context.read<NewSongProvider>().getNewSongs == null) {
        await context.read<NewSongProvider>().fetchNewSongs();
        context.read<NewSongProvider>().fetchMoreNewSongs();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 185 + 10 + 80,
            child: Consumer<NewSongProvider>(
              builder: (context, value, child) {
                if (value.getIsFechingNewSongs) {
                  return Center(child: CircularProgressIndicator());
                }
                if (value.getNewSongs != null) {
                  return value.getNewSongs!.fold(
                    (l) {
                      showSnackBar(context: context, msg: l, isSuccess: false);
                      return Center(child: Text(l));
                    },
                    (r) {
                      List<SongEntity> list = value.getFirstThreeSongList;
                      return ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 10),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => _gotoMusicPlayer(context, list[index]),
                            child: SongCardWidget(song: list[index]),
                          );
                        },
                        itemCount: list.length,
                        scrollDirection: .horizontal,
                      );
                    },
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),

          Consumer<NewSongProvider>(
            builder: (context, value, child) {
              List<SongEntity> moreSongList = value.getMoreSongList;
              return ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  if (index == moreSongList.length - 1 &&
                      value.getLastDoc != null) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      context.read<NewSongProvider>().fetchMoreNewSongs();
                    });
                    if (value.getIsFechingMoreNewSongs) {
                      return Center(child: CircularProgressIndicator());
                    }
                  }
                  if (index == moreSongList.length &&
                      value.getIsFechingNewSongs) {
                    return SizedBox();
                  }
                  if (index == moreSongList.length) {
                    if (value.getIsFechingMoreNewSongs == false &&
                        value.getLastDoc == null) {
                      return Center(child: Text('No more song to fetch.'));
                    } else {
                      return Center(child: Text('Fetching more song!'));
                    }
                  }
                  return InkWell(
                    borderRadius: .circular(8),
                    onTap: () => _gotoMusicPlayer(context, moreSongList[index]),
                    child: CustomListTileWidget(
                      moreSongList: moreSongList,
                      index: index,
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: moreSongList.length + 1,
              );
            },
          ),
        ],
      ),
    );
  }

  void _gotoMusicPlayer(BuildContext context, SongEntity songEntity) {
    Navigator.pushNamed(context, SongPlayerPage.name, arguments: songEntity);
  }
}

class CustomListTileWidget extends StatelessWidget {
  const CustomListTileWidget({
    super.key,
    required this.moreSongList,
    required this.index,
  });

  final List<SongEntity> moreSongList;
  final int index;

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
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
            ],
          ),
        ),
      ),
    );
  }
}
