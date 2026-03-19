import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/core/helper/show_snackbar.dart';
import 'package:flutter_spotify_clone/features/media/presentation/widgets/custom_tile_widget.dart';
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
      await context.read<NewSongProvider>().fetchNewSongs();
      await context.read<NewSongProvider>().fetchMoreNewSongs();
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<NewSongProvider>().fetchNewSongs();
        await context.read<NewSongProvider>().fetchMoreNewSongs();
      },
      child: SingleChildScrollView(
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
                        WidgetsBinding.instance.addPostFrameCallback(
                          (timeStamp) => showSnackBar(
                            context: context,
                            msg: l,
                            isSuccess: false,
                          ),
                        );
                        return Center(child: Text(l));
                      },
                      (r) {
                        List<SongEntity> list = value.getFirstThreeSongList;
                        return ListView.separated(
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 10),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => _gotoMusicPlayer(
                                context,
                                list[index],
                                index,
                                true,
                              ),
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
                      onTap: () => _gotoMusicPlayer(
                        context,
                        moreSongList[index],
                        index,
                        false,
                      ),
                      child: CustomListTileWidget(
                        provider: value,
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
      ),
    );
  }

  void _gotoMusicPlayer(
    BuildContext context,
    SongEntity songEntity,
    int index,
    bool isFromFirstThreeSection,
  ) {
    Navigator.pushNamed(
      context,
      SongPlayerPage.name,
      arguments: {
        "songEntity": songEntity,
        "index": index,
        "isFromFirstThreeSection": isFromFirstThreeSection,
      },
    );
  }
}
