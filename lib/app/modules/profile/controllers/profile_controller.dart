import 'package:challenge_motion_week_8/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';

class ProfileController extends GetxController {
  final authController = Get.find<AuthController>();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  void toNewPassword() {
    Get.toNamed(Routes.NEW_PASSWORD);
  }

  void toEditProfileView() {
    Get.toNamed(Routes.EDIT_USER);
  }

  void toLoginView() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
