import 'package:challenge_motion_week_8/app/shared/themes/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/new_password_controller.dart';

class NewPasswordView extends GetView<NewPasswordController> {
  const NewPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: accent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.keyboard_backspace_rounded,
            color: white,
          ),
        ),
        title: Text(
          'Ubah Password',
          style: GoogleFonts.poppins(
            color: white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: secondaryShade_3,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 36,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      TextFieldPassword(
                        controller: controller.passwordLamaController,
                        title: 'Password',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFieldPassword(
                        controller: controller.passwordBaruController,
                        title: 'Password Baru',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFieldPassword(
                        controller: controller.passwordKonfirmasiController,
                        title: 'Konfirmasi Password',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: primaryShade_3,
                    ),
                    onPressed: () {
                      String newPassword =
                          controller.passwordBaruController.text;
                      String oldPassword =
                          controller.passwordLamaController.text;
                      if (newPassword ==
                          controller.passwordKonfirmasiController.text) {
                        controller.authController
                            .reauthenticateUser(oldPassword, newPassword);
                      } else {
                        Get.snackbar(
                          'Error',
                          'Silahkan cek kembali password anda!',
                          backgroundColor: error.withOpacity(0.5),
                          colorText: white,
                        );
                      }
                      Get.back();
                    },
                    child: Text(
                      'Simpan',
                      style: GoogleFonts.poppins(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomPage(),
    );
  }
}

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
