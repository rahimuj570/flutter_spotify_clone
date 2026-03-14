import 'package:flutter_spotify_clone/features/auth/data/datasources/auth_firebase_service.dart';
import 'package:flutter_spotify_clone/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_spotify_clone/features/media/data/repositories/song_repository_impl.dart';
import 'package:flutter_spotify_clone/features/media/data/datasources/song_services.dart';
import 'package:flutter_spotify_clone/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_spotify_clone/features/media/domain/repositories/song_repository.dart';
import 'package:flutter_spotify_clone/features/auth/domain/usecases/signin_usecase.dart';
import 'package:flutter_spotify_clone/features/auth/domain/usecases/signin_with_google_usecase.dart';
import 'package:flutter_spotify_clone/features/auth/domain/usecases/signup_usecase.dart';
import 'package:flutter_spotify_clone/features/media/domain/usecases/get_more_new_songs_usecase.dart';
import 'package:flutter_spotify_clone/features/media/domain/usecases/get_news_songs_usecase.dart';
import 'package:flutter_spotify_clone/features/song_player/data/datasources/song_player_service.dart';
import 'package:flutter_spotify_clone/features/song_player/data/repositories/song_player_repository_impl.dart';
import 'package:flutter_spotify_clone/features/song_player/domain/repositories/song_player_repository.dart';
import 'package:flutter_spotify_clone/features/song_player/domain/usecases/song_control_usecase.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initilizedDependencies() async {
  getIt.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  getIt.registerSingleton<SignupUsecase>(SignupUsecase());
  getIt.registerSingleton<SigninUsecase>(SigninUsecase());
  getIt.registerSingleton<SigninWithGoogleUsecase>(SigninWithGoogleUsecase());

  getIt.registerSingleton<SongRepository>(SongRepositoryImpl());
  getIt.registerSingleton<SongServices>(SongServicesImpl());
  getIt.registerSingleton<GetNewsSongsUsecase>(GetNewsSongsUsecase());
  getIt.registerSingleton<GetMoreNewSongsUsecase>(GetMoreNewSongsUsecase());

  getIt.registerSingleton<SongPlayerService>(SongPlayerService());
  getIt.registerSingleton<SongPlayerRepository>(SongPlayerRepositoryImpl());
  getIt.registerSingleton<SongControlUsecase>(SongControlUsecase());
}
