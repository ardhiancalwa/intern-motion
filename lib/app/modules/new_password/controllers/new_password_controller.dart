import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';

class NewPasswordController extends GetxController {
  TextEditingController passwordLamaController = TextEditingController();
  TextEditingController passwordBaruController = TextEditingController();
  TextEditingController passwordKonfirmasiController = TextEditingController();
  final authController = Get.find<AuthController>();

  var passwordHidden = true.obs;
}
