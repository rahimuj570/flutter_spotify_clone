import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/features/media/data/datasources/song_services.dart';
import 'package:flutter_spotify_clone/features/media/domain/entities/song_entity.dart';
import 'package:flutter_spotify_clone/features/media/domain/usecases/get_more_new_songs_usecase.dart';
import 'package:flutter_spotify_clone/features/media/domain/usecases/get_news_songs_usecase.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class NewSongProvider extends ChangeNotifier {
  Either? _response;
  Either? get getNewSongs => _response;
  bool _isFetchingNewSongs = false;
  bool get getIsFechingNewSongs => _isFetchingNewSongs;
  QueryDocumentSnapshot? _lastDoc;
  QueryDocumentSnapshot? get getLastDoc => _lastDoc;

  bool _isFetchingMoreNewSongs = false;
  bool get getIsFechingMoreNewSongs => _isFetchingMoreNewSongs;

  final List<SongEntity> _firstThreeSongList = [];
  List<SongEntity> get getFirstThreeSongList => _firstThreeSongList;

  final List<SongEntity> _moreSongList = [];
  List<SongEntity> get getMoreSongList => _moreSongList;

  Future<void> fetchNewSongs() async {
    _isFetchingNewSongs = true;
    notifyListeners();
    _response = await getIt<GetNewsSongsUsecase>().call(null);

    _response!.fold((l) {}, (r) {
      _firstThreeSongList.addAll(r['list']);
      if ((r['list'] as List<SongEntity>).isNotEmpty) {
        _lastDoc = r['last'];
      } else {
        _lastDoc = null;
      }
    });

    _isFetchingNewSongs = false;
    notifyListeners();
  }

  Future<void> fetchMoreNewSongs() async {
    _isFetchingMoreNewSongs = true;
    notifyListeners();
    _response = await getIt<GetMoreNewSongsUsecase>().call(_lastDoc);

    _response!.fold((l) {}, (r) {
      _moreSongList.addAll(r['list']);
      if ((r['list'] as List<SongEntity>).isNotEmpty) {
        _lastDoc = r['last'];
      } else {
        _lastDoc = null;
      }
    });

    _isFetchingMoreNewSongs = false;
    notifyListeners();
  }

  int _oldRand = 0;
  SongEntity shuffleSong() {
    int rand = Random().nextInt(
      _moreSongList.length + _firstThreeSongList.length,
    );
    while (rand == _oldRand) {
      rand = Random().nextInt(
        _moreSongList.length + _firstThreeSongList.length,
      );
    }
    _oldRand = rand;
    final all = [..._moreSongList, ..._firstThreeSongList];
    return all[rand];
  }

  bool _isChangingStatus = false;
  bool get getIsChangingStatus => _isChangingStatus;
  final SongServices _services = getIt<SongServices>();

  Future<bool> isInFavourite(String uId, String mediaId) {
    return _services.isInFavourite(uId, mediaId);
  }

  ///Return true on Right if added else returning false
  void addOrRemoveFavourite(
    String mediaId,
    int index, {
    bool? isFromTopThreeSection,
  }) async {
    _isChangingStatus = true;
    notifyListeners();

    var res = await _services.addOrRemoveFavourite(mediaId);
    res.fold((l) {}, (r) {
      if (r) {
        if (isFromTopThreeSection ?? false) {
          _firstThreeSongList[index].isInFavourite = true;
        } else {
          _moreSongList[index].isInFavourite = true;
        }
      } else {
        if (isFromTopThreeSection ?? false) {
          _firstThreeSongList[index].isInFavourite = false;
        } else {
          _moreSongList[index].isInFavourite = false;
        }
      }
    });

    _isChangingStatus = false;
    notifyListeners();
  }
}
