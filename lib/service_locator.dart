import 'package:flutter_spotify_clone/features/auth/data/datasources/auth_firebase_service.dart';
import 'package:flutter_spotify_clone/features/auth/data/datasources/listen_history_service.dart';
import 'package:flutter_spotify_clone/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_spotify_clone/features/auth/data/repositories/listen_history_repository_impl.dart';
import 'package:flutter_spotify_clone/features/auth/domain/repositories/listen_history_repository.dart';
import 'package:flutter_spotify_clone/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:flutter_spotify_clone/features/auth/domain/usecases/get_listen_history_usecase.dart';
import 'package:flutter_spotify_clone/features/auth/domain/usecases/signout_user_usecase.dart';
import 'package:flutter_spotify_clone/features/favourite/data/datasources/favourite_service.dart';
import 'package:flutter_spotify_clone/features/favourite/data/repositories/favourite_song_repository_impl.dart';
import 'package:flutter_spotify_clone/features/favourite/domain/repositories/favourite_songs_repositories.dart';
import 'package:flutter_spotify_clone/features/favourite/domain/usecases/fetch_favourite_songs_usecase.dart';
import 'package:flutter_spotify_clone/features/media/data/datasources/video_services.dart';
import 'package:flutter_spotify_clone/features/media/data/repositories/song_repository_impl.dart';
import 'package:flutter_spotify_clone/features/media/data/datasources/song_services.dart';
import 'package:flutter_spotify_clone/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_spotify_clone/features/media/data/repositories/video_repository_impl.dart';
import 'package:flutter_spotify_clone/features/media/domain/repositories/song_repository.dart';
import 'package:flutter_spotify_clone/features/auth/domain/usecases/signin_usecase.dart';
import 'package:flutter_spotify_clone/features/auth/domain/usecases/signin_with_google_usecase.dart';
import 'package:flutter_spotify_clone/features/auth/domain/usecases/signup_usecase.dart';
import 'package:flutter_spotify_clone/features/media/domain/repositories/video_repository.dart';
import 'package:flutter_spotify_clone/features/media/domain/usecases/add_or_remove_favourite_usecase.dart';
import 'package:flutter_spotify_clone/features/media/domain/usecases/get_is_in_favourite_song_usecase.dart';
import 'package:flutter_spotify_clone/features/media/domain/usecases/get_more_new_songs_usecase.dart';
import 'package:flutter_spotify_clone/features/media/domain/usecases/get_news_songs_usecase.dart';
import 'package:flutter_spotify_clone/features/media/domain/usecases/get_videos_usecase.dart';
import 'package:flutter_spotify_clone/features/song_player/data/datasources/song_player_service.dart';
import 'package:flutter_spotify_clone/features/song_player/data/repositories/song_player_repository_impl.dart';
import 'package:flutter_spotify_clone/features/song_player/domain/repositories/song_player_repository.dart';
import 'package:flutter_spotify_clone/features/song_player/domain/usecases/add_to_history_usecase.dart';
import 'package:flutter_spotify_clone/features/song_player/domain/usecases/song_control_usecase.dart';
import 'package:flutter_spotify_clone/features/video_player/data/datasources/video_player_service.dart';
import 'package:flutter_spotify_clone/features/video_player/data/repositories/video_player_repository_impl.dart';
import 'package:flutter_spotify_clone/features/video_player/domain/repositories/video_player_repository.dart';
import 'package:flutter_spotify_clone/features/video_player/domain/usecases/get_random_four_videos_usecase.dart';
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

  getIt.registerSingleton<VideoServices>(VideoServices());
  getIt.registerSingleton<VideoRepository>(VideoRepositoryImpl());
  getIt.registerSingleton<GetVideosUsecase>(GetVideosUsecase());

  getIt.registerSingleton<VideoPlayerRepository>(VideoPlayerRepositoryImpl());
  getIt.registerSingleton<VideoPlayerService>(VideoPlayerService());
  getIt.registerSingleton<GetRandomFourVideosUsecase>(
    GetRandomFourVideosUsecase(),
  );

  getIt.registerSingleton<AddOrRemoveFavouriteUsecase>(
    AddOrRemoveFavouriteUsecase(),
  );
  getIt.registerSingleton<GetIsInFavouriteSongUsecase>(
    GetIsInFavouriteSongUsecase(),
  );

  getIt.registerSingleton<FavouriteService>(FavouriteServiceImpl());
  getIt.registerSingleton<FavouriteSongRepositories>(
    FavouriteSongRepositoryImpl(),
  );
  getIt.registerSingleton<FetchFavouriteSongsUsecase>(
    FetchFavouriteSongsUsecase(),
  );

  getIt.registerSingleton<GetCurrentUserUsecase>(GetCurrentUserUsecase());

  getIt.registerSingleton<AddToHistoryUsecase>(AddToHistoryUsecase());

  getIt.registerSingleton<ListenHistoryRepository>(
    ListenHistoryRepositoryImpl(),
  );
  getIt.registerSingleton<ListenHistoryService>(ListenHistoryServiceImpl());
  getIt.registerSingleton<GetListenHistoryUsecase>(GetListenHistoryUsecase());

  getIt.registerSingleton<SignoutUserUsecase>(SignoutUserUsecase());
}
