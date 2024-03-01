import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
                    TextField(
                      controller: controller.fullnameController,
                      decoration: InputDecoration(
                        labelText: 'Nama Lengkap',
                        labelStyle: TextStyle(color: bottomNav),
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
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: bottomNav),
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
                    TextField(
                      controller: controller.alamatController,
                      decoration: InputDecoration(
                        labelText: 'Alamat',
                        labelStyle: TextStyle(color: bottomNav),
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
                    SizedBox(
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
                          controller.authController.signUp(
                            controller.emailController.text,
                            controller.passwordController.text,
                          );
                        },
                        child: Text(
                          'Daftar',
                          style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: RichText(
                        text: TextSpan(
                          text: 'Sudah memiliki akun?',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: ' Login',
                              style: TextStyle(
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
              SizedBox(
                height: 41,
              ),
              Container(
                width: double.infinity,
                height: 149,
                decoration: BoxDecoration(
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
