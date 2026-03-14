import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/features/common/presentation/widgets/common_appbar.dart';
import 'package:flutter_spotify_clone/features/media/presentation/pages/new_song_page.dart';
import 'package:flutter_spotify_clone/features/home/presentation/widgets/home_tab_bar_widget.dart';
import 'package:flutter_spotify_clone/features/home/presentation/widgets/top_hero_section.dart';
import 'package:flutter_spotify_clone/features/media/presentation/pages/video_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String name = '/home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final List<Widget> _widget = [
    NewSongPage(),
    VideoPage(),
    Text('data'),
    Text('data'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        titleShow: true,
        isLeadingSearch: true,
        actionMenuShow: true,
      ),
      body: Column(
        children: [
          TopHeroSection(),
          homeTabBarWidget(tabController, context),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TabBarView(controller: tabController, children: _widget),
            ),
          ),
        ],
      ),
    );
  }
}
