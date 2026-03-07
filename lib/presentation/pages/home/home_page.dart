import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/common/widgets/common_appbar.dart';
import 'package:flutter_spotify_clone/presentation/widgets/home/top_hero_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        titleShow: true,
        isLeadingSearch: true,
        actionMenuShow: true,
      ),
      body: Column(children: [TopHeroSection()]),
    );
  }
}
