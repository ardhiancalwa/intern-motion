import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';

class EditUserController extends GetxController {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController nomorTeleponController = TextEditingController();
  final authController = Get.find<AuthController>();

  @override
  void dispose() {
    fullnameController.dispose();
    emailController.dispose();
    alamatController.dispose();
    nomorTeleponController.dispose();
    super.dispose();
  }
}
