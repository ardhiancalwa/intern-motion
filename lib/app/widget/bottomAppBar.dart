import 'package:flutter/material.dart';
import '../pages/searchPage.dart';
import '../pages/libraryPage.dart';
import '../../../main.dart';

class BottomPage extends StatelessWidget {
  const BottomPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const BottomAppBar(
      height: 55,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottonHome(),
          BottonSearch(),
          ButtonLibrary(),
          ButtonPremium(),
        ],
      ),
    );
  }
}

class ButtonPremium extends StatelessWidget {
  const ButtonPremium({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyApp()),
        );
      },
      icon: const Icon(
        Icons.now_widgets_sharp,
        color: Colors.white,
      ),
    );
  }
}

class ButtonLibrary extends StatelessWidget {
  const ButtonLibrary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LibraryScreenPage()),
        );
      },
      icon: const Icon(
        Icons.library_books,
        color: Colors.white,
      ),
    );
  }
}

class BottonSearch extends StatelessWidget {
  const BottonSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SearchScreenPage()),
        );
      },
      icon: const Icon(
        Icons.search,
        color: Colors.white,
      ),
    );
  }
}

class BottonHome extends StatelessWidget {
  const BottonHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyApp()),
        );
      },
      icon: const Icon(
        Icons.home,
        color: Colors.white,
      ),
    );
  }
}
