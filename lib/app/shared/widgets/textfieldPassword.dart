import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../modules/new_password/controllers/new_password_controller.dart';
import '../themes/colors.dart';

class TextFieldPassword extends StatelessWidget {
  final passwordHiddenController = NewPasswordController();
  TextFieldPassword({
    super.key,
    required this.controller,
    required this.title,
  });

  TextEditingController controller;
  String title;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: title,
          hintStyle: TextStyle(color: bottomNav),
          labelStyle: GoogleFonts.poppins(color: bottomNav),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: bottomNav),
          ),
          fillColor: bottomNav,
          focusColor: bottomNav,
          suffixIcon: IconButton(
            onPressed: () {
              passwordHiddenController.passwordHidden.value =
                  !passwordHiddenController.passwordHidden.value;
            },
            icon: passwordHiddenController.passwordHidden.value
                ? Image.asset(
                    'assets/icons/eye-slash.png',
                    color: bottomNav,
                  )
                : Image.asset(
                    'assets/icons/eye.png',
                    color: bottomNav,
                  ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: bottomNav,
            ),
          ),
        ),
        obscureText: passwordHiddenController.passwordHidden.value,
      ),
    );
  }
}