import 'package:get/get.dart';

import '../controllers/add_produk_controller.dart';

class AddProdukBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddProdukController>(
      () => AddProdukController(),
    );
  }
}
