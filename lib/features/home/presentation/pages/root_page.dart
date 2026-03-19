import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/core/configs/themes/app_colors.dart';
import 'package:flutter_spotify_clone/features/favourite/presentation/pages/favourite_page.dart';
import 'package:flutter_spotify_clone/features/home/presentation/pages/home_page.dart';
import 'package:flutter_spotify_clone/features/home/presentation/providers/root_page_provider.dart';
import 'package:flutter_spotify_clone/features/user/presentation/pages/user_page.dart';
import 'package:provider/provider.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});
  static const name = '/root_page';

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final List<Widget> _screens = [HomePage(), FavouritePage(), UserPage()];
  @override
  Widget build(BuildContext context) {
    return Consumer<RootPageProvider>(
      builder: (context, value, child) => Scaffold(
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          transitionBuilder: (child, animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: FadeTransition(opacity: animation, child: child),
            );
          },
          child: _screens[value.getIndex],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          height: 56,
          index: value.getIndex,
          backgroundColor: AppColors.primaryColor,
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.favorite, size: 30),
            Icon(Icons.person, size: 30),
          ],
          onTap: (index) {
            value.changeIndex(index);
          },
        ),
      ),
    );
  }
}
