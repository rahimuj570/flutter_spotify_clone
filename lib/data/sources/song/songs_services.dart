import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/data/models/song/responses/song_response.dart';
import 'package:flutter_spotify_clone/domain/entities/song/song_entity.dart';

abstract class SongsServices {
  Future<Either> getNewSongs();
}

class SongsServicesImpl implements SongsServices {
  @override
  Future<Either<dynamic, dynamic>> getNewSongs() async {
    try {
      List<SongEntity> songList = [];
      QuerySnapshot<Map<String, dynamic>> snap = await FirebaseFirestore
          .instance
          .collection('songs')
          .orderBy('releaseDate', descending: true)
          .limit(3)
          .get();
      for (var d in snap.docs) {
        songList.add(SongResponse.fromJson(d.data()).toEntity());
      }
      return Right(songList);
    } catch (e) {
      return Left('Something went wrong!');
    }
  }
}
