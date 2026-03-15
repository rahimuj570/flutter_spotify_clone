import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class SongRepository {
  Future<Either> getNewSongs();
  Future<Either> getMoreNewSongs(
    QueryDocumentSnapshot<Map<String, dynamic>> last,
  );

  Future<bool> isInFavourite(String uId, String mediaId);

  ///Return true on Right if added else returning false
  Future<Either<String, bool>> addOrRemoveFavourite(String mediaId);
}
