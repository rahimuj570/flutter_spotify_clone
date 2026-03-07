import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/core/configs/themes/app_colors.dart';

Widget homeTabBarWidget(TabController controller, BuildContext context) {
  return TabBar(
    dividerColor: Colors.transparent,
    isScrollable: true,
    indicatorColor: AppColors.primaryColor,
    controller: controller,
    labelPadding: .symmetric(horizontal: 18),
    labelStyle: Theme.of(context).textTheme.bodyLarge,
    tabs: [
      Tab(text: 'News'),
      Tab(text: 'Video'),
      Tab(text: 'Artist'),
      Tab(text: 'Podcast'),
    ],
  );
}
