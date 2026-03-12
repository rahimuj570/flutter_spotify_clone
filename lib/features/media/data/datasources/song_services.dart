import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/features/media/data/models/song_response.dart';
import 'package:flutter_spotify_clone/features/media/domain/entities/song_entity.dart';

abstract class SongServices {
  Future<Either> getNewSongs();
  Future<Either> getMoreNewSongs(
    QueryDocumentSnapshot<Map<String, dynamic>> last,
  );
}

class SongServicesImpl implements SongServices {
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
      return Right({'last': snap.docs.last, 'list': songList});
    } catch (e) {
      return Left('Something went wrong!');
    }
  }

  @override
  Future<Either<dynamic, dynamic>> getMoreNewSongs(
    QueryDocumentSnapshot<Map<String, dynamic>> last,
  ) async {
    try {
      List<SongEntity> songList = [];
      QuerySnapshot<Map<String, dynamic>> snap = await FirebaseFirestore
          .instance
          .collection('songs')
          .orderBy('releaseDate', descending: true)
          .startAfterDocument(last)
          .limit(10)
          .get();
      if (snap.docs.isNotEmpty) {
        for (var d in snap.docs) {
          songList.add(SongResponse.fromJson(d.data()).toEntity());
        }
      }
      return Right({
        'last': snap.docs.isEmpty ? null : snap.docs.last,
        'list': songList,
      });
    } catch (e) {
      return Left('Something went wrong!');
    }
  }
}
