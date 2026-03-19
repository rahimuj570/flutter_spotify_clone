import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_spotify_clone/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class UserProvider extends ChangeNotifier {
  UserEntity? get userEntity => getIt<GetCurrentUserUsecase>().getCurrentUser();
}
