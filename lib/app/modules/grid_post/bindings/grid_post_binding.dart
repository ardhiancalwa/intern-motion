import 'package:get/get.dart';

import '../controllers/grid_post_controller.dart';

class GridPostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GridPostController>(
      () => GridPostController(),
    );
  }
}
