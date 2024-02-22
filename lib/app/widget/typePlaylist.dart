import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class TypePlaylist extends StatelessWidget {
  final String nameType;
  const TypePlaylist({
    super.key,
    required this.nameType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              Text(
                nameType,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Playlist(
                  description: faker.lorem.sentence(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Playlist extends StatelessWidget {
  final String description;
  const Playlist({
    super.key,
    required this.description,
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
          10,
          (index) {
            return Container(
              width: 150,
              height: 190,
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  Image.network(
                      faker.image.image(random: true, width: 160, height: 140)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    description,
                    style: TextStyle(color: Colors.grey[400], fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
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