import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/domain/repositories/auth/auth_repository.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class SigninWithGoogleUsecase {
  Future<Either<dynamic, dynamic>> call() {
    return getIt<AuthRepository>().signinWithGoogle();
  }
}
