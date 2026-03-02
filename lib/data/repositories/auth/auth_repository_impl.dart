import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/data/models/create_user_request.dart';
import 'package:flutter_spotify_clone/data/sources/auth_firebase_service.dart';
import 'package:flutter_spotify_clone/domain/repositories/auth/auth_repository.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(CreateUserRequest createUserRequest) async {
    return await getIt<AuthFirebaseService>().signup(createUserRequest);
  }
}
