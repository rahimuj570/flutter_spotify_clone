import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/core/configs/themes/app_colors.dart';
import 'package:flutter_spotify_clone/features/common/presentation/widgets/common_appbar.dart';
import 'package:flutter_spotify_clone/features/media/domain/entities/video_entity.dart';
import 'package:flutter_spotify_clone/features/media/presentation/pages/video_page.dart';
import 'package:flutter_spotify_clone/features/video_player/presentation/providers/video_player_provider.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  final VideoEntity video;
  const VideoPlayer({super.key, required this.video});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<VideoPlayerProvider>().fetchRandomFourVideos(
      mediaId: widget.video.mediaId,
    );
    _controller = YoutubePlayerController(
      initialVideoId: widget.video.mediaId,
      flags: YoutubePlayerFlags(autoPlay: true, mute: false),
    );
    _controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _controller.value.isFullScreen
          ? null
          : CommonAppbar(
              titleShow: false,
              isLeadingSearch: false,
              actionMenuShow: false,
              textTile: 'Video Playing',
            ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(_controller.value.isFullScreen ? 0 : 10.0),
          child: YoutubePlayerBuilder(
            player: YoutubePlayer(controller: _controller),
            builder: (context, player) {
              return Column(
                crossAxisAlignment: .start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: _controller.value.isFullScreen
                          ? null
                          : .all(color: AppColors.primaryColor, width: 3),
                    ),
                    child: Hero(tag: widget.video.mediaId, child: player),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            widget.video.title,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            "Artists : ${widget.video.artists}",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            "Released Year : ${widget.video.releaseDate.toDate().year.toString()}",
                          ),
                        ],
                      ),
                      Text(" ${widget.video.duration}"),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border_rounded),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Row(
                    children: [
                      Text(
                        'More Videos',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  Consumer<VideoPlayerProvider>(
                    builder: (context, provider, child) => GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: provider.getRandomFourVideos.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                      ),
                      itemBuilder: (context, index) => Tile(
                        index: index,
                        video: provider.getRandomFourVideos[index],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
