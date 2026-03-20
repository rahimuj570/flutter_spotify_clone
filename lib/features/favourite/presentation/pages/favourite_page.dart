import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/core/configs/assets/app_images.dart';
import 'package:flutter_spotify_clone/core/helper/show_snackbar.dart';
import 'package:flutter_spotify_clone/features/common/presentation/widgets/common_appbar.dart';
import 'package:flutter_spotify_clone/features/media/domain/entities/song_entity.dart';
import 'package:flutter_spotify_clone/features/favourite/presentation/providers/favourite_songs_provider.dart';
import 'package:flutter_spotify_clone/features/home/presentation/providers/root_page_provider.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<FavouriteSongsProvider>().fetchFavouriteSongs();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        context.read<RootPageProvider>().changeIndex(0);
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CommonAppbar(
          backAction: () {
            print('object');
            context.read<RootPageProvider>().changeIndex(0);
          },
          titleShow: false,
          isLeadingSearch: false,
          actionMenuShow: true,
          color: Colors.white,
        ),
        body: Consumer<FavouriteSongsProvider>(
          builder: (context, provider, child) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              if (provider.getErrorMsg != null) {
                showSnackBar(context: context, msg: provider.getErrorMsg!);
              }
            });
            if (provider.getErrorMsg != null) {
              return Center(child: Text('Something Went Wrong!'));
            }
            List<SongEntity> songList = provider.getFavouriteSongList;

            return Column(
              children: [
                AspectRatio(
                  aspectRatio: 390 / 240,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: .only(
                        bottomLeft: .circular(50),
                        bottomRight: .circular(50),
                      ),
                      image: DecorationImage(
                        fit: .cover,
                        colorFilter: ColorFilter.mode(Colors.black, .overlay),
                        image: AssetImage(AppImages.favouriteImagePath),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Favourites',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Center(
                  child: Text(
                    '${songList.length} Tracks',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Expanded(
                  child: Visibility(
                    visible: provider.getISFavouriteSongFetching == false,
                    replacement: Center(child: CircularProgressIndicator()),
                    child: ListView.separated(
                      itemBuilder: (context, index) => index == songList.length
                          ? Center(
                              child: Text('No more favourite song to show'),
                            )
                          : ListTile(
                              title: Text(songList[index].title),
                              subtitle: Text(songList[index].artists),
                              trailing: Row(
                                mainAxisSize: .min,
                                children: [
                                  Text(
                                    songList[index].duration
                                        .toString()
                                        .replaceAll(".", ":"),
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(width: 20),
                                  IconButton(
                                    onPressed: () async {
                                      var res = await provider
                                          .addOrRemoveFavourite(
                                            songList[index].media,
                                            index,
                                          );
                                      res.fold((l) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((timeStamp) {
                                              showSnackBar(
                                                context: context,
                                                msg: l,
                                                isSuccess: false,
                                              );
                                            });
                                      }, (r) {});
                                    },
                                    icon: Icon(Icons.favorite_rounded),
                                  ),
                                ],
                              ),
                            ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10),
                      itemCount: songList.length + 1,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
