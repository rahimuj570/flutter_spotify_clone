import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/data/models/create_user_request.dart';

abstract class AuthRepository {
  Future<Either> signup(CreateUserRequest createUserRequest);
  Future<Either> signin();
}
