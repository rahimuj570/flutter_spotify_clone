import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/core/helper/show_snackbar.dart';
import 'package:flutter_spotify_clone/features/media/domain/entities/song_entity.dart';
import 'package:flutter_spotify_clone/features/media/presentation/provders/new_song_provider.dart';
import 'package:flutter_spotify_clone/features/media/presentation/widgets/song_card_widget.dart';
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

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (context.read<NewSongProvider>().getNewSongs == null) {
        context.read<NewSongProvider>().fetchNewSongs();
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
                      List<SongEntity> list = r as List<SongEntity>;
                      return ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 10),
                        itemBuilder: (context, index) {
                          return SongCardWidget(song: list[index]);
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
        ],
      ),
    );
  }
}
