import 'package:get/get.dart';

import '../controllers/upload_image_controller.dart';

class UploadImageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadImageController>(
      () => UploadImageController(),
    );
  }
}
