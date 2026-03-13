import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/core/configs/themes/app_colors.dart';
import 'package:flutter_spotify_clone/core/helper/show_snackbar.dart';
import 'package:flutter_spotify_clone/features/common/presentation/widgets/common_appbar.dart';
import 'package:flutter_spotify_clone/features/common/presentation/widgets/overflow_aware_text.dart';
import 'package:flutter_spotify_clone/features/media/domain/entities/song_entity.dart';
import 'package:flutter_spotify_clone/features/song_player/presentation/providers/song_player_provider.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class SongPlayerPage extends StatefulWidget {
  const SongPlayerPage({super.key, required this.songEntity});
  static const String name = '/song_player';
  final SongEntity songEntity;

  @override
  State<SongPlayerPage> createState() => _SongPlayerPageState();
}

class _SongPlayerPageState extends State<SongPlayerPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<SongPlayerProvider>().loadSong(widget.songEntity.media);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        titleShow: false,
        isLeadingSearch: false,
        actionMenuShow: true,
        textTile: 'Now Playing',
      ),
      body: Consumer<SongPlayerProvider>(
        builder: (context, provider, child) {
          if (provider.getError != null) {
            showSnackBar(
              context: context,
              msg: provider.getError!,
              isSuccess: false,
            );
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 335 / 370,
                    child: Hero(
                      tag: 'topThreeSong${widget.songEntity.media}',
                      child: ClipRRect(
                        borderRadius: .circular(18),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://spolify-spotify-clone.web.app/covers/${widget.songEntity.media}.jpg",
                          fit: .fill,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            widget.songEntity.title,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          OverflowAwareText(
                            maxWidth: 270,
                            text: widget.songEntity.artists,
                            style: Theme.of(context).textTheme.bodyLarge!
                                .copyWith(fontWeight: .normal),
                          ),
                        ],
                      ),

                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border_rounded),
                      ),
                    ],
                  ),
                  SizedBox(height: 28),

                  StreamBuilder<Duration>(
                    stream: provider.getAudioPlayer.positionStream,
                    builder: (context, snapshot) {
                      final position = snapshot.data ?? Duration.zero;
                      final buffered = provider.getAudioPlayer.bufferedPosition;
                      final total =
                          provider.getAudioPlayer.duration ?? Duration.zero;

                      return ProgressBar(
                        progress: position,
                        buffered: buffered,
                        total: total,
                        onSeek: provider.seekSong,
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  StreamBuilder<PlayerState>(
                    stream: provider.getAudioPlayer.playerStateStream,
                    builder: (context, snapshot) {
                      final playerState = snapshot.data;

                      if (provider.getIsLoadingSong) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (playerState == null) {
                        return const Icon(Icons.music_note);
                      }

                      if (playerState.playing) {
                        return IconButton(
                          onPressed: provider.playPauseSong,
                          icon: const Icon(Icons.pause_circle_filled_outlined),
                        );
                      } else {
                        return Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            IconButton(
                              onPressed: provider.repeateOnOff,
                              icon: Icon(
                                provider.getAudioPlayer.loopMode == LoopMode.all
                                    ? Icons.repeat_on_rounded
                                    : Icons.repeat_rounded,
                                size: 35,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.skip_previous_rounded, size: 40),
                            ),
                            IconButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                              ),
                              onPressed: provider.playPauseSong,
                              icon: const Icon(
                                Icons.play_arrow_rounded,
                                color: Colors.white,
                                size: 48,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.skip_next_rounded, size: 40),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.shuffle_rounded, size: 35),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
