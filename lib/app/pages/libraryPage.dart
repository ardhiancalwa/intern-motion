import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import '../widget/bottomAppBar.dart';
import '../widget/profileAppBar.dart';

class LibraryScreenPage extends StatelessWidget {
  const LibraryScreenPage({super.key});

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
          leading: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: ProfileAppBar(),
          ),
          title: const Text(
            "Your Library",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.sort,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Recent",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.apps_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Playlist()
            ],
          ),
        ),
        bottomNavigationBar: const BottomPage(),
      ),
    );
  }
}

class Playlist extends StatelessWidget {
  const Playlist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: double.infinity,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Image.network(
                          "${faker.image.image(random: true, width: 100, height: 100)}"),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${faker.person.lastName()}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "Playlist · calwa._",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
