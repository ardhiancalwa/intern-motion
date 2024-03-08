import 'package:challenge_motion_week_8/app/shared/themes/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      Get.dialog(
        AlertDialog(
          // ignore: prefer_const_constructors
          content: Text(
            'Password telah dikirim! Silahkan Cek Email anda',
            textAlign: TextAlign.center,
          ),
          contentTextStyle: TextStyle(
            color: primaryColor,
            fontSize: 20,
          ),
          icon: Icon(
            Icons.check_circle,
            color: primaryColor,
            size: 60,
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      Get.dialog(
        AlertDialog(
          content: Text(
            e.message.toString(),
            textAlign: TextAlign.center,
          ),
          contentTextStyle: TextStyle(
            color: error,
            fontSize: 20,
          ),
          icon: Icon(
            Icons.dangerous_outlined,
            color: error,
            size: 60,
          ),
        ),
      );
    }
  }

  void toLoginView() {
    Get.back();
  }
}
