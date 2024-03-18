import 'package:get/get.dart';

import '../controllers/botton_nav_controller.dart';

class BottonNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottonNavController>(
      () => BottonNavController(),
    );
  }
}
