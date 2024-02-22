import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'dart:math';
import '../widget/bottomAppBar.dart';
import '../widget/profileAppBar.dart';
import '../widget/pickedSong.dart';

class SearchScreenPage extends StatelessWidget {
  const SearchScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Raleway',
      ),
      home: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: const Padding(
              padding: EdgeInsets.only(left: 20),
              child: ProfileAppBar(),
            ),
            title: const Text(
              "Search",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: Colors.grey[700],
                                size: 30,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "What do you want to listen is?",
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const PickedForYou(),
                    const ExploreGenre(),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Browse All",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    BrowsAll(),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomPage(),
        ),
      ),
    );
  }
}

class BrowsAll extends StatelessWidget {
  final List<Map<String, String>> gridMap = List.generate(
    50,
    (index) => {
      "title": "${faker.person.lastName()}",
      "images": "${faker.image.image(random: true, width: 300)}",
    },
  );

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 6 / 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10),
      itemCount: gridMap.length,
      itemBuilder: (_, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color.fromARGB(
              255,
              Random().nextInt(256),
              Random().nextInt(256),
              Random().nextInt(256),
            ),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  topLeft: Radius.circular(5),
                ),
                child: Image.network("${gridMap[index]['images']}"),
              ),
              const SizedBox(
                width: 25,
                height: 25,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "${gridMap[index]['title']}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ExploreGenre extends StatelessWidget {
  const ExploreGenre({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Text(
                "Explore your genres",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListGenre(),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ListGenre extends StatelessWidget {
  const ListGenre({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("object");
      },
      child: Wrap(
        direction: Axis.horizontal,
        children: List.generate(
          5,
          (index) {
            return Container(
              width: 110,
              height: 190,
              margin: const EdgeInsets.only(right: 10),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      "${faker.image.image(random: true, width: 120, height: 170)}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "${faker.person.lastName()}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
