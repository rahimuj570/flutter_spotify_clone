import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/features/auth/data/datasources/auth_firebase_service.dart';
import 'package:flutter_spotify_clone/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_spotify_clone/features/media/domain/entities/song_entity.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

abstract class ListenHistoryService {
  Future<Either<String, List<SongEntity>>> fetchFavouriteSongs();
}

class ListenHistoryServiceImpl implements ListenHistoryService {
  @override
  Future<Either<String, List<SongEntity>>> fetchFavouriteSongs() async {
    try {
      UserEntity? user = getIt<AuthFirebaseService>().getUser();
      List<SongEntity> songList = [];
      if (user == null) {
        return Left('Something Went Wrong');
      } else {
        QuerySnapshot snapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.email)
            .collection('favourites')
            .get();

        List<String> mediaList = [];
        for (var snap in snapshot.docs) {
          mediaList.add(snap['mediaId']);
        }

        for (String id in mediaList) {
          QuerySnapshot snap = await FirebaseFirestore.instance
              .collection('songs')
              .where('media', isEqualTo: id)
              .get();
          if (snap.docs.isNotEmpty) {
            QueryDocumentSnapshot documentSnapshot = snap.docs.first;
            songList.add(
              SongEntity(
                title: documentSnapshot['title'],
                artists: documentSnapshot['artists'],
                duration: documentSnapshot['duration'],
                releaseDate: documentSnapshot['releaseDate'],
                media: documentSnapshot['media'],
                isInFavourite: null,
              ),
            );
          }
        }
        return Right(songList);
      }
    } catch (e) {
      return left(e.toString());
    }
  }
}
