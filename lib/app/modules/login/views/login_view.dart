import 'package:challenge_motion_week_8/app/shared/themes/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/items/login.png',
                  height: 118,
                  width: 127,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: GoogleFonts.poppins(color: bottomNav),
                          fillColor: bottomNav,
                          focusColor: bottomNav,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: bottomNav),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: bottomNav,
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => TextField(
                          controller: controller.passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintStyle: TextStyle(color: bottomNav),
                            labelStyle: GoogleFonts.poppins(color: bottomNav),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: bottomNav),
                            ),
                            fillColor: bottomNav,
                            focusColor: bottomNav,
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.passwordHidden.value =
                                    !controller.passwordHidden.value;
                              },
                              icon: controller.passwordHidden.value
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: bottomNav,
                                    )
                                  : Icon(
                                      Icons.visibility,
                                      color: bottomNav,
                                    ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: bottomNav,
                              ),
                            ),
                          ),
                          obscureText: controller.passwordHidden.value,
                        ),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            controller.toResetPassword();
                          },
                          child: Text(
                            'lupa password?',
                            style: GoogleFonts.poppins(color: primaryColor),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 38,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryShade_3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            controller.authController
                                .signIn(
                              controller.emailController.text,
                              controller.passwordController.text,
                            )
                                .then((signInSuccessful) {
                              if (signInSuccessful) {
                                Get.snackbar(
                                  'Selamat',
                                  'Login Berhasil',
                                  backgroundColor: white.withOpacity(0.5),
                                  colorText: primaryColor,
                                  duration: const Duration(seconds: 3),
                                  animationDuration: const Duration(seconds: 1),
                                );
                              } else {
                                Get.snackbar(
                                  'Gagal Login',
                                  'Coba periksa email dan password anda',
                                  backgroundColor: error.withOpacity(0.1),
                                  colorText: error,
                                  duration: const Duration(seconds: 4),
                                  animationDuration: const Duration(seconds: 1),
                                );
                              }
                            }).catchError((error) {
                              print('Error during sign in: $error');
                              // Handle other errors if needed
                            });
                          },
                          child: Text(
                            'Masuk',
                            style: GoogleFonts.poppins(
                              color: white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.toRegisterPage();
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'Belum memiliki akun?',
                            style: GoogleFonts.poppins(color: product),
                            children: [
                              TextSpan(
                                text: ' Daftar',
                                style: GoogleFonts.poppins(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 68,
                ),
                Container(
                  width: double.infinity,
                  height: 149,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/items/sayur.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
