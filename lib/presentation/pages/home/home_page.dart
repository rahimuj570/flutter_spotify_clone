import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/common/widgets/common_appbar.dart';
import 'package:flutter_spotify_clone/presentation/widgets/home/home_tab_bar_widget.dart';
import 'package:flutter_spotify_clone/presentation/widgets/home/top_hero_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

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
        children: [TopHeroSection(), homeTabBarWidget(tabController, context)],
      ),
    );
  }
}
