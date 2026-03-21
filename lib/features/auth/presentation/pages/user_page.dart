import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/core/configs/themes/app_colors.dart';
import 'package:flutter_spotify_clone/core/extensions/is_dark_mode_extension.dart';
import 'package:flutter_spotify_clone/core/helper/show_snackbar.dart';
import 'package:flutter_spotify_clone/features/auth/domain/usecases/signout_user_usecase.dart';
import 'package:flutter_spotify_clone/features/auth/presentation/pages/signin_page.dart';
import 'package:flutter_spotify_clone/features/auth/presentation/providers/listen_history_provider.dart';
import 'package:flutter_spotify_clone/features/auth/presentation/providers/user_provider.dart';
import 'package:flutter_spotify_clone/features/choose_mode/presentation/providers/theme_provider.dart';
import 'package:flutter_spotify_clone/features/home/presentation/providers/root_page_provider.dart';
import 'package:flutter_spotify_clone/features/media/domain/entities/song_entity.dart';
import 'package:flutter_spotify_clone/service_locator.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ListenHistoryProvider>().fetchListenHistorySongs();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        context.read<RootPageProvider>().changeIndex(0);
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,

        body: Consumer2<UserProvider, ListenHistoryProvider>(
          builder: (context, userProvider, historyProvider, child) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              if (historyProvider.getErrorMsg != null) {
                showSnackBar(
                  context: context,
                  msg: historyProvider.getErrorMsg!,
                );
              }
            });
            if (historyProvider.getErrorMsg != null) {
              return Center(child: Text('Something Went Wrong!'));
            }
            List<SongEntity> songList =
                historyProvider.getListenHistorySongList;

            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  backgroundColor: context.isDarkMode ? null : Colors.white,
                  title: Text(
                    'Profile',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(fontWeight: .bold),
                  ),
                  centerTitle: true,

                  leading: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: IconButton(
                      onPressed: () =>
                          context.read<RootPageProvider>().changeIndex(0),
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
                        child: Icon(Icons.arrow_back_ios_new, size: 15),
                      ),
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        context.read<ThemeProvider>().changeThemeMode(
                          isDark: !context.isDarkMode,
                        );
                      },
                      icon: Icon(
                        context.isDarkMode
                            ? Icons.dark_mode_rounded
                            : Icons.light_mode_rounded,
                      ),
                    ),
                  ],
                ),
                // Profile header
                SliverToBoxAdapter(
                  child: AspectRatio(
                    aspectRatio: 390 / 240,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                        color: context.isDarkMode
                            ? AppColors.darkNavBarColor
                            : Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person_pin, size: 80),
                          Text(userProvider.userEntity?.email ?? 'N/A'),
                          Text(userProvider.userEntity?.fullName ?? 'N/A'),
                          IconButton(
                            onPressed: () async {
                              var res = await getIt<SignoutUserUsecase>()
                                  .signout();
                              res.fold(
                                (l) {
                                  WidgetsBinding.instance.addPostFrameCallback((
                                    timeStamp,
                                  ) {
                                    showSnackBar(
                                      context: context,
                                      msg: l,
                                      isSuccess: false,
                                    );
                                  });
                                },
                                (r) {
                                  Navigator.pushNamed(context, SigninPage.name);
                                },
                              );
                            },
                            icon: Icon(Icons.logout),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SliverToBoxAdapter(child: SizedBox(height: 20)),
                SliverAppBar(
                  pinned: true,
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  toolbarHeight: 80,
                  title: Text('Listen History'),
                ),

                SliverToBoxAdapter(child: SizedBox(height: 30)),
                // Song list
                historyProvider.getIsListenHistorySongFetching
                    ? SliverFillRemaining(
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : SliverList.separated(
                        itemCount: songList.length + 1,
                        itemBuilder: (context, index) {
                          if (index == songList.length) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                top: 10.0,
                                bottom: 20,
                              ),
                              child: const Center(
                                child: Text('No more favourite song to show'),
                              ),
                            );
                          }
                          final song = songList[index];
                          return ListTile(
                            title: Text(song.title),
                            subtitle: Text(song.artists),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  song.duration.toString().replaceAll(".", ":"),
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 20),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
