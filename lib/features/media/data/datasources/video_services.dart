import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spotify_clone/features/media/domain/entities/video_entity.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoServices {
  final List<VideoEntity> _videos = [
    VideoEntity(
      title: 'Punorjonmo',
      artists: 'Chondropith',
      duration: 7.59,
      releaseDate: Timestamp.fromDate(DateTime.parse("2021-02-27")),
      mediaId: "TPiCWUQ78CY",
    ),
    VideoEntity(
      title: 'Onno Groher Chad',
      artists: 'Sohan Ali',
      duration: 3.00,
      releaseDate: Timestamp.fromDate(DateTime.parse("2014-02-27")),
      mediaId: YoutubePlayer.convertUrlToId(
        "https://www.youtube.com/watch?v=Y1z069Ci5aE&list=RDY1z069Ci5aE&start_radio=1&pp=ygUEc29uZ6AHAQ%3D%3D",
      )!,
    ),
    VideoEntity(
      title: 'Ei Obelay',
      artists: 'Shironamhin',
      duration: 6.23,
      releaseDate: Timestamp.fromDate(DateTime.parse("2012-02-27")),
      mediaId: YoutubePlayer.convertUrlToId(
        "https://www.youtube.com/watch?v=agYzgxruck0&list=RDagYzgxruck0&start_radio=1&pp=ygUEc29uZ6AHAQ%3D%3D",
      )!,
    ),
    VideoEntity(
      title: 'Prem Tumi',
      artists: 'Tahsan',
      duration: 5.57,
      releaseDate: Timestamp.fromDate(DateTime.parse("2016-02-27")),
      mediaId: YoutubePlayer.convertUrlToId(
        "https://www.youtube.com/watch?v=F9DstkJDyXw&list=RDF9DstkJDyXw&start_radio=1&pp=ygUEc29uZ6AHAQ%3D%3D",
      )!,
    ),
    VideoEntity(
      title: 'Mayabi',
      artists: 'Blue Touch',
      duration: 4.07,
      releaseDate: Timestamp.fromDate(DateTime.parse("2023-02-27")),
      mediaId: YoutubePlayer.convertUrlToId(
        "https://www.youtube.com/watch?v=riy2ANErV3o&list=RDriy2ANErV3o&start_radio=1&pp=ygUEc29uZ6AHAQ%3D%3D",
      )!,
    ),
    VideoEntity(
      title: 'Chiro Odhora',
      artists: 'Miftah Zaman',
      duration: 6.23,
      releaseDate: Timestamp.fromDate(DateTime.parse("2010-02-27")),
      mediaId: YoutubePlayer.convertUrlToId(
        "https://www.youtube.com/watch?v=hZ9di6zroWQ&list=RDhZ9di6zroWQ&start_radio=1&pp=ygUMbWlmdGFoIHphbWFuoAcB",
      )!,
    ),
    VideoEntity(
      title: 'Tomar Jonno',
      artists: 'Arnob',
      duration: 4.36,
      releaseDate: Timestamp.fromDate(DateTime.parse("2008-02-27")),
      mediaId: YoutubePlayer.convertUrlToId(
        "https://www.youtube.com/watch?v=hWHCsysOxBk&list=RDhWHCsysOxBk&start_radio=1&pp=ygUXa2F0aCBnb2xhcGVyIHNhZGFyIG1heWGgBwE%3D",
      )!,
    ),
  ];

  List<VideoEntity> getVideos() {
    return _videos;
  }
}
