import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class FourPlaylist extends StatefulWidget {
  const FourPlaylist({
    super.key,
  });

  @override
  State<FourPlaylist> createState() => _FourPlaylistState();
}

class _FourPlaylistState extends State<FourPlaylist> {
  final List<Map<String, String>> gridMap = [
    {
      "title": "${faker.person.lastName()}",
      "images": "${faker.image.image(random: true)}"
    },
    {
      "title": "${faker.person.lastName()}",
      "images": "${faker.image.image(random: true)}"
    },
    {
      "title": "${faker.person.lastName()}",
      "images": "${faker.image.image(random: true)}"
    },
    {
      "title": "${faker.person.lastName()}",
      "images": "${faker.image.image(random: true)}"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4 / 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10),
      itemCount: gridMap.length,
      itemBuilder: (_, index) {
        return Container(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  topLeft: Radius.circular(5),
                ),
                child: Image.network("${gridMap.elementAt(index)['images']}"),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "${gridMap.elementAt(index)['title']}",
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              )
            ],
          ),
        );
      },
    );
  }
}
