import 'package:cloud_firestore/cloud_firestore.dart';

class SongEntity {
  final String title;
  final String artists;
  final double duration;
  final Timestamp releaseDate;
  final String media;

  SongEntity({
    required this.title,
    required this.artists,
    required this.duration,
    required this.releaseDate,
    required this.media,
  });
}
