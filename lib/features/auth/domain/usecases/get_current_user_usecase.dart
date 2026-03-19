import 'package:flutter_spotify_clone/features/auth/data/datasources/auth_firebase_service.dart';
import 'package:flutter_spotify_clone/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class GetCurrentUserUsecase {
  UserEntity? getCurrentUser() {
    return getIt<AuthFirebaseService>().getUser();
  }
}
