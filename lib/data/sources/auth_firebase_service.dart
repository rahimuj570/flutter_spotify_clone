import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spotify_clone/data/models/auth/requests/create_user_request.dart';
import 'package:flutter_spotify_clone/data/models/auth/requests/signin_user_request.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthFirebaseService {
  Future<Either> signin(SigninUserRequest signinUserRequest);
  Future<Either> signinWithGoogle();
  Future<Either> signup(CreateUserRequest createUserRequest);
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<Either> signin(SigninUserRequest param) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: param.email,
        password: param.password,
      );
      return Right("Successfully Signin!");
    } on FirebaseAuthException catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either> signinWithGoogle() async {
    String webclient =
        "206270099584-347p3ndo62jag9j4i3munhl0a9ibg6le.apps.googleusercontent.com";
    try {
      final googleSignin = GoogleSignIn.instance;

      await googleSignin.initialize(serverClientId: webclient);
      GoogleSignInAccount account = await googleSignin.authenticate();

      GoogleSignInAuthentication gAuth = account.authentication;

      AuthCredential credential = await GoogleAuthProvider.credential(
        idToken: gAuth.idToken,
      );

      FirebaseAuth.instance.signInWithCredential(credential);

      return Right("Successfully Loggd in!");
    } catch (e) {
      print(e.toString());
      return Left("Could not login with Google");
    }
  }

  @override
  Future<Either> signup(CreateUserRequest createUserRequest) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserRequest.email,
        password: createUserRequest.password,
      );
      FirebaseAuth.instance.currentUser!.updateDisplayName(
        createUserRequest.fullName,
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
