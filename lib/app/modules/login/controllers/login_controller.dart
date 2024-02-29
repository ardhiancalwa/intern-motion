import 'package:challenge_motion_week_8/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var passwordHidden = true.obs;

  void toRegisterPage() {
    Get.toNamed(Routes.REGISTER);
  }
}
