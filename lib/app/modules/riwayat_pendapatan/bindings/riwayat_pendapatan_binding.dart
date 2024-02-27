import 'package:get/get.dart';

import '../controllers/riwayat_pendapatan_controller.dart';

class RiwayatPendapatanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiwayatPendapatanController>(
      () => RiwayatPendapatanController(),
    );
  }
}
