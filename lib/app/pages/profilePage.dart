import 'package:flutter/material.dart';
import './libraryPage.dart';

class ProfileScreenPage extends StatelessWidget {
  const ProfileScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Raleway',
      ),
      home: Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.black,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            )),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.green,
                Colors.black,
              ],
              stops: [0.1, 0.4],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            "assets/images/calwa.png",
                            width: 100,
                            height: 100,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "calwa._",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(children: [
                                  Text(
                                    "25 ",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "followers",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    " · ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    "25 ",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "following",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ]),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          // Perform an action when the button is pressed
                        },
                        child: const Text(
                          'Edit',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(
                        Icons.more_vert,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                const Playlist(),
                Center(
                  child: OutlinedButton(
                    onPressed: () {
                      // Perform an action when the button is pressed
                    },
                    child: const Text(
                      'See all playlist',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomAppBar(
          height: 55,
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.home,
                color: Colors.white,
              ),
              Icon(
                Icons.search,
                color: Colors.white,
              ),
              Icon(
                Icons.library_books,
                color: Colors.white,
              ),
              Icon(
                Icons.now_widgets_sharp,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
