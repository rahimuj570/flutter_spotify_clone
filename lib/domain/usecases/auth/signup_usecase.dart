import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/core/usecase/usecase.dart';
import 'package:flutter_spotify_clone/data/models/create_user_request.dart';
import 'package:flutter_spotify_clone/domain/repositories/auth/auth_repository.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class SignupUsecase implements Usecase<Either, CreateUserRequest> {
  @override
  Future<Either> call(CreateUserRequest param) async {
    return await getIt<AuthRepository>().signup(param);
  }
}
