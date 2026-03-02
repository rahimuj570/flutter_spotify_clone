import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/core/configs/themes/app_colors.dart';

void showSnackBar({
  required BuildContext context,
  required String msg,
  bool isSuccess = true,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msg, style: TextStyle(color: Colors.white)),
      backgroundColor: isSuccess ? AppColors.primaryColor : Colors.red,
    ),
  );
}
