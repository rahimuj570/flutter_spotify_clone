import 'package:flutter_spotify_clone/data/repositories/auth/auth_repository_impl.dart';
import 'package:flutter_spotify_clone/data/sources/auth_firebase_service.dart';
import 'package:flutter_spotify_clone/domain/repositories/auth/auth_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initilizedDependencies() async {
  getIt.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());
}
