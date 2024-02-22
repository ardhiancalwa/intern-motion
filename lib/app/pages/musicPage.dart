import 'package:flutter/material.dart';
import 'package:spotify_clone/app/pages/homePage.dart';
import 'package:spotify_clone/app/theme/color.dart';
import './pocastPage.dart';
import './searchPage.dart';
import '../widget/profileAppBar.dart';
import '../widget/bottomAppBar.dart';
import '../widget/topFourPlaylist.dart';
import '../widget/buttonAppBar.dart';

class MusicScreenPage extends StatelessWidget {
  const MusicScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Raleway',
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          // toolbarHeight: 40,
          leading: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: ProfileAppBar(),
          ),
          title: Row(
            children: [
              ButtonAppBar(
                buttonName: 'All',
                destination: const HomeScreenPage(),
                color: thirdColor,
                textColor: secondaryTextColor,
              ),
              const SizedBox(width: 10),
              ButtonAppBar(
                buttonName: 'Music',
                destination: const MusicScreenPage(),
                color: primaryColor,
                textColor: primaryTextColor,
              ),
              const SizedBox(width: 10),
              ButtonAppBar(
                buttonName: 'Podcast',
                destination: const PodcastScreenPage(),
                color: thirdColor,
                textColor: secondaryTextColor,
              ),
            ],
          ),
          centerTitle: false,
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              FourPlaylist(),
              ExploreGenre(),
              ListPodcast(),
            ],
          ),
        ),
        bottomNavigationBar: const BottomPage(),
      ),
    );
  }
}
