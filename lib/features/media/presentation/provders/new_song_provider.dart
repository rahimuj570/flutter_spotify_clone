import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/features/media/domain/usecases/get_news_songs_usecase.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class NewSongProvider extends ChangeNotifier {
  Either? _response;
  Either? get getNewSongs => _response;
  bool _isFetchingNewSongs = false;
  bool get getIsFechingNewSongs => _isFetchingNewSongs;

  Future<void> fetchNewSongs() async {
    _isFetchingNewSongs = true;
    notifyListeners();
    _response = await getIt<GetNewsSongsUsecase>().call(null);
    _isFetchingNewSongs = false;
    notifyListeners();
  }
}
