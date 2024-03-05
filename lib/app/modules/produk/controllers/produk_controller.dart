import 'package:challenge_motion_week_8/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProdukController extends GetxController {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  void toAddProdukView() {
    Get.toNamed(Routes.ADD_PRODUK);
  }
}
