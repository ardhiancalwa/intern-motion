import 'package:flutter/material.dart';
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
}
