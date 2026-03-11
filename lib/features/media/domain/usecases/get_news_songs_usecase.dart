import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/core/usecase/usecase.dart';
import 'package:flutter_spotify_clone/features/media/domain/repositories/song_repository.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class GetNewsSongsUsecase implements Usecase<Either, dynamic> {
  @override
  Future<Either<dynamic, dynamic>> call(param) async {
    return await getIt<SongRepository>().getNewSongs();
  }
}
