import 'package:cloud_firestore/cloud_firestore.dart';

class SongEntity {
  String title;
  String artists;
  double duration;
  Timestamp releaseDate;
  String media;
  bool? isInFavourite;

  SongEntity({
    required this.title,
    required this.artists,
    required this.duration,
    required this.releaseDate,
    required this.media,
    required this.isInFavourite,
  });

  void changeValues(SongEntity e) {
    title = e.title;
    artists = e.artists;
    duration = e.duration;
    releaseDate = e.releaseDate;
    media = e.media;
    isInFavourite = e.isInFavourite;
  }
}
