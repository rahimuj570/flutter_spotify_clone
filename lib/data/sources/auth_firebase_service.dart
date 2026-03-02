import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spotify_clone/data/models/create_user_request.dart';

abstract class AuthFirebaseService {
  Future<void> signin();
  Future<void> signup(CreateUserRequest createUserRequest);
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<void> signup(CreateUserRequest createUserRequest) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserRequest.email,
        password: createUserRequest.password,
      );
    } catch (e) {}
  }
}
