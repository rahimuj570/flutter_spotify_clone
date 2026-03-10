import 'package:flutter_spotify_clone/data/repositories/auth/auth_repository_impl.dart';
import 'package:flutter_spotify_clone/data/repositories/song/song_repository_impl.dart';
import 'package:flutter_spotify_clone/data/sources/auth/auth_firebase_service.dart';
import 'package:flutter_spotify_clone/data/sources/song/songs_services.dart';
import 'package:flutter_spotify_clone/domain/repositories/auth/auth_repository.dart';
import 'package:flutter_spotify_clone/domain/repositories/song/song_repository.dart';
import 'package:flutter_spotify_clone/domain/usecases/auth/signin_usecase.dart';
import 'package:flutter_spotify_clone/domain/usecases/auth/signin_with_google_usecase.dart';
import 'package:flutter_spotify_clone/domain/usecases/auth/signup_usecase.dart';
import 'package:flutter_spotify_clone/domain/usecases/song/get_news_songs_usecase.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initilizedDependencies() async {
  getIt.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  getIt.registerSingleton<SignupUsecase>(SignupUsecase());
  getIt.registerSingleton<SigninUsecase>(SigninUsecase());
  getIt.registerSingleton<SigninWithGoogleUsecase>(SigninWithGoogleUsecase());

  getIt.registerSingleton<SongRepository>(SongRepositoryImpl());
  getIt.registerSingleton<SongsServices>(SongsServicesImpl());
  getIt.registerSingleton<GetNewsSongsUsecase>(GetNewsSongsUsecase());
}
