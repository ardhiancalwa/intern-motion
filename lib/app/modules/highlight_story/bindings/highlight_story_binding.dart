import 'package:get/get.dart';

import '../controllers/highlight_story_controller.dart';

class HighlightStoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HighlightStoryController>(
      () => HighlightStoryController(),
    );
  }
}
