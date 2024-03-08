import 'package:challenge_motion_week_8/app/controllers/auth_controller.dart';
import 'package:challenge_motion_week_8/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final authController = Get.find<AuthController>();
  var passwordHidden = true.obs;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void toRegisterPage() {
    Get.toNamed(Routes.REGISTER);
  }

  void toResetPassword() {
    Get.toNamed(Routes.RESET_PASSWORD);
  }
}
