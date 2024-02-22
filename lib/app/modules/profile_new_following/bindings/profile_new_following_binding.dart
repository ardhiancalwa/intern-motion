import 'package:get/get.dart';

import '../controllers/profile_new_following_controller.dart';

class ProfileNewFollowingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileNewFollowingController>(
      () => ProfileNewFollowingController(),
    );
  }
}
