import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/data/models/auth/requests/create_user_request.dart';
import 'package:flutter_spotify_clone/domain/usecases/auth/signup_usecase.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class SignupProvider extends ChangeNotifier {
  bool _isCreatingUser = false;
  Either<dynamic, dynamic>? _response;

  bool get getIsCreatingUser => _isCreatingUser;
  Either<dynamic, dynamic> get getResponse => _response!;

  Future<void> createUser({
    required String fullName,
    required String email,
    required String password,
  }) async {
    _response = null;
    _isCreatingUser = true;
    notifyListeners();

    _response = await getIt<SignupUsecase>().call(
      CreateUserRequest(fullName: fullName, email: email, password: password),
    );

    _isCreatingUser = false;
    notifyListeners();
  }
}
