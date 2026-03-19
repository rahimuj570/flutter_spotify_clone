import 'package:dartz/dartz.dart';

abstract class FavouriteSongRepositories {
  Future<Either> fetchFavouriteSongs();
}
