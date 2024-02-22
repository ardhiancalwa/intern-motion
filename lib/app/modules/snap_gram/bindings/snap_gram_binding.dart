import 'package:get/get.dart';

import '../controllers/snap_gram_controller.dart';

class SnapGramBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SnapGramController>(
      () => SnapGramController(),
    );
  }
}
