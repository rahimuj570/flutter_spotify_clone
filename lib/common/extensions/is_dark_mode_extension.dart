import 'package:flutter/material.dart';

extension IsDarkModeExtension on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
