import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/core/usecase/usecase.dart';
import 'package:flutter_spotify_clone/data/models/auth/requests/signin_user_request.dart';
import 'package:flutter_spotify_clone/domain/repositories/auth/auth_repository.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class SigninUsecase implements Usecase<Either, SigninUserRequest> {
  @override
  Future<Either<dynamic, dynamic>> call(SigninUserRequest param) {
    return getIt<AuthRepository>().signin(param);
  }
}
