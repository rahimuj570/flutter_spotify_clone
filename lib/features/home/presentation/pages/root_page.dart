import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/core/configs/themes/app_colors.dart';
import 'package:flutter_spotify_clone/features/favourite/presentation/pages/favourite_page.dart';
import 'package:flutter_spotify_clone/features/home/presentation/pages/home_page.dart';
import 'package:flutter_spotify_clone/features/user/presentation/pages/user_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});
  static const name = '/root_page';

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final List<Widget> _screens = [HomePage(), FavouritePage(), UserPage()];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 56,
        index: _currentIndex,
        backgroundColor: AppColors.primaryColor,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.favorite, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
