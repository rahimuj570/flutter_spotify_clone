import 'package:flutter/cupertino.dart';

class RootPageProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get getIndex => _currentIndex;

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
