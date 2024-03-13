import 'package:challenge_motion_week_8/app/controllers/auth_controller.dart';
import 'package:challenge_motion_week_8/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nomorTeleponController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final authController = Get.find<AuthController>();

  var passwordHidden = true.obs;
  var confirmPasswordHidden = true.obs;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    fullnameController.dispose();
    alamatController.dispose();
    nomorTeleponController.dispose();
    super.dispose();
  }

  void toLoginPage() {
    Get.toNamed(Routes.LOGIN);
  }
}
