import 'package:challenge_motion_week_8/app/shared/themes/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/edit_user_controller.dart';

class EditUserView extends GetView<EditUserController> {
  const EditUserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: accent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: secondaryShade_3,
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
            'Ubah Profil',
            style: GoogleFonts.poppins(
              color: white,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(
                              0.5), // Change opacity and color as needed
                          BlendMode.srcATop,
                        ),
                        child: Image.asset(
                          'assets/images/profil/profile.png',
                          height: 80,
                          width: 80,
                        ),
                      ),
                      Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                      ),
                    ],
                  ),
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
                    keyboard: TextInputType.number,
                    textEditingController: controller.nomorTeleponController,
                  ),
                  SizedBox(
                    height: 180,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryShade_3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        'Simpan',
                        style: GoogleFonts.poppins(
                          color: white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
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

  final EditUserController controller;

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
