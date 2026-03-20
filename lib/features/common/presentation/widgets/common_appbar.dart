import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/core/extensions/is_dark_mode_extension.dart';
import 'package:flutter_spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:flutter_spotify_clone/features/choose_mode/presentation/providers/theme_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool titleShow;
  final bool isLeadingSearch;
  final bool actionMenuShow;
  final String? textTile;
  final Color? color;
  final VoidCallback? backAction;

  const CommonAppbar({
    super.key,
    required this.titleShow,
    required this.isLeadingSearch,
    required this.actionMenuShow,
    this.textTile,
    this.color,
    this.backAction,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, value, child) => AppBar(
        foregroundColor: color,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: titleShow
            ? SvgPicture.asset(width: 108, AppVectors.logoPath)
            : Text(
                textTile ?? '',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontWeight: .bold),
              ),
        centerTitle: true,

        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            onPressed: () =>
                backAction == null ? Navigator.pop(context) : backAction!(),
            icon: Container(
              alignment: Alignment.center,
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: context.isDarkMode
                    ? Colors.white.withValues(alpha: .03)
                    : Colors.black.withValues(alpha: .04),
                shape: BoxShape.circle,
              ),
              child: isLeadingSearch
                  ? Icon(Icons.search_rounded)
                  : Icon(Icons.arrow_back_ios_new, size: 15),
            ),
          ),
        ),

        actions: actionMenuShow
            ? [
                IconButton(
                  onPressed: () {
                    value.changeThemeMode(isDark: !context.isDarkMode);
                  },
                  icon: Icon(
                    context.isDarkMode
                        ? Icons.dark_mode_rounded
                        : Icons.light_mode_rounded,
                  ),
                ),
              ]
            : [],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
