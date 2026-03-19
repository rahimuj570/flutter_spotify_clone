import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/features/auth/domain/usecases/get_listen_history_usecase.dart';
import 'package:flutter_spotify_clone/features/media/domain/entities/song_entity.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class ListenHistoryProvider extends ChangeNotifier {
  bool _isListenHistorySongFetching = false;
  String? _errorMsg;
  final List<SongEntity> _listenHisotyList = [];
  List<SongEntity> get getListenHistorySongList => _listenHisotyList;

  bool get getIsListenHistorySongFetching => _isListenHistorySongFetching;
  String? get getErrorMsg => _errorMsg;

  Future<void> fetchListenHistorySongs() async {
    _listenHisotyList.clear();
    _errorMsg = null;
    _isListenHistorySongFetching = true;
    notifyListeners();
    var res = await getIt<GetListenHistoryUsecase>().fetchListenHistorySongs();
    res.fold(
      (l) {
        _errorMsg = l;
      },
      (r) {
        for (SongEntity e in r) {
          _listenHisotyList.add(
            SongEntity(
              title: e.title,
              artists: e.artists,
              duration: e.duration,
              releaseDate: e.releaseDate,
              media: e.media,
              isInFavourite: null,
            ),
          );
        }
      },
    );
    _isListenHistorySongFetching = false;
    notifyListeners();
  }
}
