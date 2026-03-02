import 'package:flutter_spotify_clone/data/models/create_user_request.dart';

abstract class AuthRepository {
  Future<void> signup(CreateUserRequest createUserRequest);
  Future<void> signin();
}
