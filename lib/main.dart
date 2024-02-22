import 'package:deep_dive_get_cli/app/modules/edit_profile/controllers/edit_profile_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  final editProfileController = Get.put(EditProfileController());
  runApp(
    Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: editProfileController.isDark.value
            ? ThemeData.dark()
            : ThemeData.light(),
      ),
    ),
  );
}
