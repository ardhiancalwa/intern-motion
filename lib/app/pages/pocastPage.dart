import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/app/theme/color.dart';
import './homePage.dart';
import './musicPage.dart';
import '../widget/profileAppBar.dart';
import '../widget/bottomAppBar.dart';
import '../widget/buttonAppBar.dart';

class PodcastScreenPage extends StatelessWidget {
  const PodcastScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        fontFamily: 'Raleway',
      ),
      home: const HomeScreenPodcast(),
    );
  }
}

class HomeScreenPodcast extends StatelessWidget {
  const HomeScreenPodcast({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
              color: thirdColor,
              textColor: secondaryTextColor,
            ),
            const SizedBox(width: 10),
            ButtonAppBar(
              buttonName: 'Podcast',
              destination: const PodcastScreenPage(),
              color: primaryColor,
              textColor: primaryTextColor,
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            EpisodePodcast(),
            ListPodcast(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomPage(),
    );
  }
}

class ListPodcast extends StatelessWidget {
  const ListPodcast({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
                onTap: () {},
                child: Wrap(
                  direction: Axis.horizontal,
                  children: List.generate(
                    50,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 20),
                        child: Container(
                          width: double.infinity,
                          height: 500,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[900]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 15, left: 15, top: 20, bottom: 5),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                      "${faker.image.image(random: true)}"),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${faker.conference.name()}",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                    Text(
                                      "Episode • ${faker.person.lastName()}",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      faker.lorem.sentence(),
                                      style:
                                          const TextStyle(color: Colors.grey),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Row(
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Icon(
                                          Icons.more_vert,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${faker.date.month()} 2023 • ${faker.randomGenerator.integer(60)} mins",
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Icon(
                                          Icons.play_circle,
                                          color: Colors.white,
                                          size: 40,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class EpisodePodcast extends StatelessWidget {
  const EpisodePodcast({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                  "${faker.image.image(random: true, width: 250, height: 250)}"),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[900],
            ),
            child: const Icon(Icons.add, size: 50, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
