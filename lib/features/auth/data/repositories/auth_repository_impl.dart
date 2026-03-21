import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/features/auth/data/datasources/auth_firebase_service.dart';
import 'package:flutter_spotify_clone/features/auth/data/models/create_user_request.dart';
import 'package:flutter_spotify_clone/features/auth/data/models/signin_user_request.dart';
import 'package:flutter_spotify_clone/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either> signin(SigninUserRequest param) async {
    return await getIt<AuthFirebaseService>().signin(param);
  }

  @override
  Future<Either> signup(CreateUserRequest createUserRequest) async {
    return await getIt<AuthFirebaseService>().signup(createUserRequest);
  }

  @override
  Future<Either<dynamic, dynamic>> signinWithGoogle() async {
    return await getIt<AuthFirebaseService>().signinWithGoogle();
  }

  @override
  Future<Either<dynamic, dynamic>> signOut() {
    return getIt<AuthFirebaseService>().singout();
  }
}
