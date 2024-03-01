import 'package:challenge_motion_week_8/app/controllers/auth_controller.dart';
import 'package:challenge_motion_week_8/app/data/model/home.dart';
import 'package:challenge_motion_week_8/app/modules/register/controllers/register_controller.dart';
import 'package:challenge_motion_week_8/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final authController = Get.find<AuthController>();
  // final registerController = Get.find<RegisterController>();

  HomeModel homeModel = HomeModel(
    nama: 'nama',
    image: 'profile',
    pendapatan: 160000,
    produkDiterima: 52,
    produkDiproses: 100,
  );

  void toProfileView() {
    Get.toNamed(Routes.PROFILE);
  }

  void toRiwayatPendapatanView() {
    Get.toNamed(Routes.RIWAYAT_PENDAPATAN);
  }
}
