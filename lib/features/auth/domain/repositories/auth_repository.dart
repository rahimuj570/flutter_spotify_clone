import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/features/auth/data/models/create_user_request.dart';
import 'package:flutter_spotify_clone/features/auth/data/models/signin_user_request.dart';

abstract class AuthRepository {
  Future<Either> signup(CreateUserRequest createUserRequest);
  Future<Either> signin(SigninUserRequest signinUserRequest);
  Future<Either> signinWithGoogle();
  Future<Either> signOut();
}
