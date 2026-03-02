import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spotify_clone/data/models/create_user_request.dart';

abstract class AuthFirebaseService {
  Future<Either> signin();
  Future<Either> signup(CreateUserRequest createUserRequest);
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<Either> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(CreateUserRequest createUserRequest) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserRequest.email,
        password: createUserRequest.password,
      );
      return Right('Successfully User Created');
    } on FirebaseAuthException catch (e) {
      String errorMgs = '';

      switch (e.code) {
        case 'invalid-email':
          errorMgs = "Invalid Email!";
          break;
        case 'email-already-in-use':
          errorMgs = 'An account already exist on this email';
          break;
        case 'weak-password':
          errorMgs = 'Password is too weak';
          break;
        default:
          errorMgs = 'Something went wrong! Please contact to support.';
      }

      return Left(errorMgs);
    }
  }
}
