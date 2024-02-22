import 'package:flutter/material.dart';
import 'package:spotify_clone/app/theme/color.dart';
import './musicPage.dart';
import './pocastPage.dart';
import '../widget/bottomAppBar.dart';
import '../widget/profileAppBar.dart';
import '../widget/typePlaylist.dart';
import '../widget/topFourPlaylist.dart';
import '../widget/pickedSong.dart';
import '../widget/buttonAppBar.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({
    super.key,
  });

  @override
  State<HomeScreenPage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              color: primaryColor,
              textColor: primaryTextColor,
            ),
            const SizedBox(width: 10),
            ButtonAppBar(
              buttonName: 'Music',
              destination: const MusicScreenPage(),
              color: thirdColor,
              textColor: secondaryTextColor,
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
            PickedForYou(),
            TypePlaylist(
              nameType: 'Uniquely Yours',
            ),
            SizedBox(
              height: 20,
            ),
            TypePlaylist(
              nameType: 'Your Top Mixes',
            ),
            SizedBox(
              height: 20,
            ),
            TypePlaylist(
              nameType: 'Recently Played',
            ),
            SizedBox(
              height: 20,
            ),
            TypePlaylist(
              nameType: 'Happy Songs',
            ),
            SizedBox(
              height: 20,
            ),
            TypePlaylist(
              nameType: 'Made For calwa._',
            ),
            SizedBox(
              height: 20,
            ),
            TypePlaylist(
              nameType: 'Sad Songs',
            ),
            SizedBox(
              height: 20,
            ),
            ListPodcast(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomPage(),
    );
  }
}
