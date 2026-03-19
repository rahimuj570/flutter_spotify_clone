import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/features/favourite/domain/usecases/fetch_favourite_songs_usecase.dart';
import 'package:flutter_spotify_clone/features/media/domain/entities/song_entity.dart';
import 'package:flutter_spotify_clone/features/media/domain/usecases/add_or_remove_favourite_usecase.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class FavouriteSongsProvider extends ChangeNotifier {
  bool _isFavouriteSongFetching = false;
  String? _errorMsg;
  final List<SongEntity> _favouriteSongList = [];
  List<SongEntity> get getFavouriteSongList => _favouriteSongList;

  bool get getISFavouriteSongFetching => _isFavouriteSongFetching;
  String? get getErrorMsg => _errorMsg;

  Future<void> fetchFavouriteSongs() async {
    _favouriteSongList.clear();
    _errorMsg = null;
    _isFavouriteSongFetching = true;
    notifyListeners();
    var res = await getIt<FetchFavouriteSongsUsecase>().fetchFavouriteSongs();
    res.fold(
      (l) {
        _errorMsg = l;
      },
      (r) {
        for (SongEntity e in r) {
          _favouriteSongList.add(
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
    _isFavouriteSongFetching = false;
    notifyListeners();
  }

  void addOrRemoveFavourite(String media, int index) async {
    var res = await getIt<AddOrRemoveFavouriteUsecase>().addOrRemoveFavourite(
      media,
    );
    _favouriteSongList.removeAt(index);
    notifyListeners();
  }
}
