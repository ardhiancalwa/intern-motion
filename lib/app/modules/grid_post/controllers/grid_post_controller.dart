import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GridPostController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void onInit() {
    tabController = TabController(length: gridPost.length, vsync: this);
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  final List<Tab> gridPost = <Tab>[
    const Tab(
      icon: Icon(Icons.grid_on),
    ),
    const Tab(
      icon: Icon(Icons.video_collection_outlined),
    ),
    const Tab(
      icon: Icon(Icons.person_pin_outlined),
    ),
  ];

  final List<Map<String, String>> postMap = [
    {
      'image': 'assets/images/post/steve_halama.png',
    },
    {
      'image': 'assets/images/post/raul_angel.png',
    },
    {
      'image': 'assets/images/post/morgan_aragon.png',
    },
    {
      'image': 'assets/images/post/josen_alejandro.png',
    },
    {
      'image': 'assets/images/post/jesus_santos.png',
    },
    {
      'image': 'assets/images/post/grace_ho.png',
    },
    {
      'image': 'assets/images/post/shuttergames.png',
    },
    {
      'image': 'assets/images/post/everton_vila.png',
    },
    {
      'image': 'assets/images/post/eric_waber.png',
    },
  ];
  final List<Map<String, String>> reelsMap = List.generate(15, (index) {
    return {
      'images': faker.image.image(
        random: true,
        width: 130,
        height: 200,
      )
    };
  });
}
