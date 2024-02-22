import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/grid_post_controller.dart';

class GridPostView extends GetView<GridPostController> {
  final GridPostController _tabx = Get.put(GridPostController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        bottom: TabBar(
          overlayColor: MaterialStatePropertyAll(Colors.grey.withOpacity(0.2)),
          labelColor: Theme.of(context).brightness == Brightness.light
              ? Colors.black
              : Colors.white,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Theme.of(context).brightness == Brightness.light
              ? Colors.black
              : Colors.white,
          controller: _tabx.tabController,
          tabs: _tabx.gridPost,
        ),
      ),
      body: Flexible(
        child: TabBarView(
          controller: _tabx.tabController,
          children: [
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemCount: _tabx.postMap.length,
              itemBuilder: (_, index) {
                return InkWell(
                  onTap: () {
                    print("berhasil");
                  },
                  child: Image.asset(
                    "${_tabx.postMap.elementAt(index)['image']}",
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                childAspectRatio: 1 / 2,
              ),
              itemCount: _tabx.reelsMap.length,
              itemBuilder: (_, index) {
                return InkWell(
                  onTap: () {},
                  child: Image.network(
                    "${_tabx.reelsMap.elementAt(index)['images']}",
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemCount: _tabx.postMap.length,
              itemBuilder: (_, index) {
                return InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "${_tabx.postMap.elementAt(index)['image']}",
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
