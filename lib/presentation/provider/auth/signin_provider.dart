import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/domain/usecases/auth/signin_with_google_usecase.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class SigninProvider extends ChangeNotifier {
  bool _isSigninProcessing = false;
  bool get getIsSigninProcessing => _isSigninProcessing;

  Either<dynamic, dynamic>? _response;
  Either<dynamic, dynamic> get getResponse => _response!;

  Future<void> signin({
    required bool withPassword,
    required bool withGoogle,
    required bool withApple,
  }) async {
    _isSigninProcessing = true;
    notifyListeners();
    if (withGoogle) {
      _response = await getIt<SigninWithGoogleUsecase>().call();
    }
    _isSigninProcessing = false;
    notifyListeners();
  }
}
