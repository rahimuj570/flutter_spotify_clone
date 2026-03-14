import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/core/configs/themes/app_colors.dart';
import 'package:flutter_spotify_clone/features/media/domain/entities/video_entity.dart';
import 'package:flutter_spotify_clone/features/media/presentation/provders/video_provider.dart';
import 'package:flutter_spotify_clone/features/video_player/presentation/pages/video_player.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<VideoProvider>().fetchVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VideoProvider>(
      builder: (context, provider, child) => GridView.builder(
        itemCount: provider.getVideos.length,
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          repeatPattern: QuiltedGridRepeatPattern.inverted,
          pattern: [
            QuiltedGridTile(2, 4),
            QuiltedGridTile(2, 2),
            QuiltedGridTile(2, 2),
          ],
        ),
        itemBuilder: (context, index) {
          VideoEntity video = provider.getVideos[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VideoPlayer(video: video),
              ),
            ),
            child: Tile(index: index, video: video),
          );
        },
      ),
    );
  }
}

class Tile extends StatelessWidget {
  final int index;
  final VideoEntity video;
  const Tile({super.key, required this.index, required this.video});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          opacity: .8,
          fit: .fill,
          image: NetworkImage(
            YoutubePlayer.getThumbnail(videoId: video.mediaId),
          ),
        ),
        color: Colors.teal,
      ),
      child: Center(
        child: Container(
          decoration: BoxDecoration(shape: .circle, color: Colors.black),
          child: Icon(
            Icons.play_circle_fill_rounded,
            size: 50,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
