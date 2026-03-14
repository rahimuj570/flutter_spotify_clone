import 'package:cloud_firestore/cloud_firestore.dart';

class VideoEntity {
  String title;
  String artists;
  double duration;
  Timestamp releaseDate;
  String mediaId;

  VideoEntity({
    required this.title,
    required this.artists,
    required this.duration,
    required this.releaseDate,
    required this.mediaId,
  });

  void changeValues(VideoEntity e) {
    title = e.title;
    artists = e.artists;
    duration = e.duration;
    releaseDate = e.releaseDate;
    mediaId = e.mediaId;
  }
}
