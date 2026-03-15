import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/features/media/data/datasources/song_services.dart';
import 'package:flutter_spotify_clone/features/media/domain/repositories/song_repository.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class SongRepositoryImpl implements SongRepository {
  @override
  Future<Either<dynamic, dynamic>> getNewSongs() {
    return getIt<SongServices>().getNewSongs();
  }

  @override
  Future<Either<dynamic, dynamic>> getMoreNewSongs(
    QueryDocumentSnapshot<Map<String, dynamic>> last,
  ) {
    return getIt<SongServices>().getMoreNewSongs(last);
  }

  @override
  Future<Either<String, bool>> addOrRemoveFavourite(String mediaId) {
    return getIt<SongServices>().addOrRemoveFavourite(mediaId);
  }

  @override
  Future<bool> isInFavourite(String uId, String mediaId) {
    return getIt<SongServices>().isInFavourite(uId, mediaId);
  }
}
