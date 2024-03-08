import 'dart:io';

import 'package:challenge_motion_week_8/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';

class AddProdukController extends GetxController {
  final namaProdukController = TextEditingController();
  final deskripsiController = TextEditingController();
  final kategoriController = TextEditingController();
  final hargaController = TextEditingController();
  final jumlahController = TextEditingController();
  final durasiController = TextEditingController();
  final beratController = TextEditingController();
  final authController = Get.find<AuthController>();
  // final uploadImageController = Get.find<UploadImageController>();

  void toUploadImageView() {
    Get.toNamed(Routes.UPLOAD_IMAGE);
  }

  // Future<void> uploadImagesAndAddProdukToFirestore() async {
  //   await uploadImageController.uploadImagesToFirestore();
  //   // Now you can access the selected images from UploadImageController
  //   // and add the new product with those images to Firestore here.
  //   // Use the relevant TextEditingController's text to get other product details.
  // }
}
