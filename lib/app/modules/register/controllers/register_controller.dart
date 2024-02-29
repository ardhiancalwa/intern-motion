import 'package:challenge_motion_week_8/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final fullname = TextEditingController();
  final email = TextEditingController();
  final alamat = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  var passwordHidden = true.obs;

  void toLoginPage() {
    Get.toNamed(Routes.LOGIN);
  }
}
