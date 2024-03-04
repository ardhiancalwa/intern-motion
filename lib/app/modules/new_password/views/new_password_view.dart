import 'package:challenge_motion_week_8/app/shared/themes/colors.dart';
import 'package:challenge_motion_week_8/app/shared/widgets/bottomNavBar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/new_password_controller.dart';

class NewPasswordView extends GetView<NewPasswordController> {
  const NewPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ubah Password',
          style: TextStyle(
            color: white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: secondaryShade_3,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [],
          ),
        ),
      ),
      bottomNavigationBar: BottomPage(),
    );
  }
}
