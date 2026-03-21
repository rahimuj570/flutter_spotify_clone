import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class SignoutUserUsecase {
  Future<Either> signout() async {
    return getIt<AuthRepository>().signOut();
  }
}
