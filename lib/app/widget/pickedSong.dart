import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class PickedForYou extends StatelessWidget {
  const PickedForYou({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Picked for you",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.drag_indicator,
                color: Colors.white,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[900],
            ),
            width: double.infinity,
            height: 150,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                  child: Image.network(
                      "${faker.image.image(random: true, width: 250, height: 250)}"),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, top: 10, right: 10, bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Single",
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 12,
                          ),
                        ),
                        const Text(
                          "Itu Aku - Spotify Singles",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          faker.lorem.sentence(),
                          style:
                              TextStyle(color: Colors.grey[400], fontSize: 12),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                print("yes");
                              },
                              icon: const Icon(
                                Icons.add,
                                size: 35,
                                color: Colors.grey,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                print("no");
                              },
                              icon: const Icon(
                                Icons.play_circle_filled_outlined,
                                size: 35,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}