import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/themes/colors.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19),
                child: Column(
                  children: [
                    InputText(
                      controller: controller,
                      tittle: 'Nama Lengkap',
                      keyboard: TextInputType.text,
                      textEditingController: controller.fullnameController,
                    ),
                    InputText(
                      controller: controller,
                      tittle: 'Email',
                      keyboard: TextInputType.emailAddress,
                      textEditingController: controller.emailController,
                    ),
                    InputText(
                      controller: controller,
                      tittle: 'Alamat',
                      keyboard: TextInputType.text,
                      textEditingController: controller.alamatController,
                    ),
                    InputText(
                      controller: controller,
                      tittle: 'Nomor Telepon',
                      keyboard: TextInputType.phone,
                      textEditingController: controller.nomorTeleponController,
                    ),
                    Obx(
                      () => TextField(
                        controller: controller.passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintStyle: TextStyle(color: bottomNav),
                          labelStyle: TextStyle(color: bottomNav),
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
                        obscureText: controller.passwordHidden.value,
                      ),
                    ),
                    Obx(
                      () => TextField(
                        controller: controller.confirmPasswordController,
                        decoration: InputDecoration(
                          labelText: 'Konfirmasi Password',
                          hintStyle: TextStyle(color: bottomNav),
                          labelStyle: TextStyle(color: bottomNav),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: bottomNav),
                          ),
                          fillColor: bottomNav,
                          focusColor: bottomNav,
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.confirmPasswordHidden.value =
                                  !controller.confirmPasswordHidden.value;
                            },
                            icon: controller.confirmPasswordHidden.value
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
                        obscureText: controller.passwordHidden.value,
                      ),
                    ),
                    const SizedBox(
                      height: 48,
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
                          if (controller.confirmPasswordController.value ==
                              controller.passwordController.value) {
                            controller.authController.signUp(
                              controller.emailController.text,
                              controller.passwordController.text,
                              controller.fullnameController.text,
                              controller.alamatController.text,
                              int.parse(
                                controller.nomorTeleponController.text,
                              ),
                            );
                          } else {
                            Get.snackbar('Error', 'Tolong cek lagi!');
                          }
                        },
                        child: Text(
                          'Daftar',
                          style: GoogleFonts.poppins(
                            color: white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: RichText(
                        text: TextSpan(
                          text: 'Sudah memiliki akun?',
                          style: GoogleFonts.poppins(color: product),
                          children: [
                            TextSpan(
                              text: ' Login',
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
                height: 41,
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
      ),
    );
  }
}

class InputText extends StatelessWidget {
  final String tittle;
  final TextInputType keyboard;
  final TextEditingController textEditingController;
  const InputText({
    super.key,
    required this.controller,
    required this.tittle,
    required this.keyboard,
    required this.textEditingController,
  });

  final RegisterController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboard,
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: tittle,
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
    );
  }
}
