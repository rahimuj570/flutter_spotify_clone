import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spotify_clone/features/media/data/models/song_response.dart';
import 'package:flutter_spotify_clone/features/media/domain/entities/song_entity.dart';

abstract class SongServices {
  Future<Either> getNewSongs();
  Future<Either> getMoreNewSongs(
    QueryDocumentSnapshot<Map<String, dynamic>> last,
  );
  Future<bool> isInFavourite(String uId, String mediaId);

  ///Return true on Right if added else returning false
  Future<Either<String, bool>> addOrRemoveFavourite(String mediaId);
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
        SongResponse response = SongResponse.fromJson(d.data());
        bool inFav = await isInFavourite(
          FirebaseAuth.instance.currentUser!.email!,
          response.media,
        );
        response.isInFavourite = inFav;
        songList.add(response.toEntity());
      }
      return Right({'last': snap.docs.last, 'list': songList});
    } catch (e) {
      debugPrint("ddddddddddddd ${e.toString()}");
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
          SongResponse response = SongResponse.fromJson(d.data());
          bool inFav = await isInFavourite(
            FirebaseAuth.instance.currentUser!.email!,
            response.media,
          );
          response.isInFavourite = inFav;
          songList.add(response.toEntity());
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

  @override
  Future<bool> isInFavourite(String email, String mediaId) async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(email)
        .collection('favourites')
        .doc(mediaId)
        .get();

    return snapshot.exists;
  }

  ///Return true on Right if added else returning false
  @override
  Future<Either<String, bool>> addOrRemoveFavourite(String mediaId) async {
    User user = FirebaseAuth.instance.currentUser!;
    bool inFavourite = await isInFavourite(user.email!, mediaId);
    debugPrint("sssssss start");
    debugPrint("sssssss ${user.uid}");
    try {
      DocumentReference ref = FirebaseFirestore.instance
          .collection('users')
          .doc(user.email)
          .collection('favourites')
          .doc(mediaId);
      if (inFavourite) {
        debugPrint('eeeeeeeeeeeeeee exist');
        await ref.delete();
        return Right(false);
      } else {
        debugPrint('nnnnnnnnnnn Not exist');

        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.email)
            .collection('favourites')
            .doc(mediaId)
            .set({'mediaId': mediaId, 'timeStamp': Timestamp.now()});
        return Right(true);
      }
    } catch (e) {
      debugPrint("dddddddddd ${e.toString()}");
      return Left(e.toString());
    }
  }
}
