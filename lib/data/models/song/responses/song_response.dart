import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spotify_clone/domain/entities/song/song_entity.dart';

class SongResponse {
  final String title;
  final String artists;
  final double duration;
  final Timestamp releaseDate;

  SongResponse({
    required this.title,
    required this.artists,
    required this.duration,
    required this.releaseDate,
  });

  factory SongResponse.fromJson(Map<String, dynamic> map) {
    return SongResponse(
      title: map['title'] as String,
      artists: map['artists'] as String,
      duration: map['duration'] as double,
      releaseDate: map['releaseDate'] as Timestamp,
    );
  }

  SongEntity toEntity() {
    return SongEntity(
      title: title,
      artists: artists,
      duration: duration,
      releaseDate: releaseDate,
    );
  }
}
