import 'package:deep_dive_get_cli/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  const Bottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = HomeController();
    return BottomAppBar(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () => homeController.toHomeView(),
            icon: const Icon(Icons.home_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.video_collection_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_bag_outlined),
          ),
          GestureDetector(
            onTap: () => homeController.toEditProfileView(),
            child: const CircleAvatar(
              backgroundImage:
                  AssetImage("assets/images/profile/foto_profile.jpg"),
            ),
          )
        ],
      ),
    );
  }
}
