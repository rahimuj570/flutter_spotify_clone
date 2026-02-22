import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/common/extensions/is_dark_mode_extension.dart';
import 'package:flutter_spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool titleShow;
  final bool isLeadingSearch;
  final bool actionMenuShow;
  const CommonAppbar({
    super.key,
    required this.titleShow,
    required this.isLeadingSearch,
    required this.actionMenuShow,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: titleShow
          ? SvgPicture.asset(width: 108, AppVectors.logoPath)
          : null,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
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
      actions: actionMenuShow
          ? [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined))]
          : [],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
