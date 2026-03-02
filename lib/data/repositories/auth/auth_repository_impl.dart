import 'package:flutter_spotify_clone/data/models/create_user_request.dart';
import 'package:flutter_spotify_clone/data/sources/auth_firebase_service.dart';
import 'package:flutter_spotify_clone/domain/repositories/auth/auth_repository.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<void> signup(CreateUserRequest createUserRequest) async {
    await getIt<AuthFirebaseService>().signup(createUserRequest);
  }
}
