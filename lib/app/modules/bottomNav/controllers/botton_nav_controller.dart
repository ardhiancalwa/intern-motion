import 'package:get/get.dart';

class BottonNavController extends GetxController {
  var tabIndex = 0.obs; // Menggunakan .obs untuk membuat variabel reaktif

  void changeTabIndex(int index) {
    tabIndex.value = index; // Memperbarui nilai reaktif
  }
}
