import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/riwayat/bindings/riwayat_binding.dart';
import '../modules/riwayat/views/riwayat_view.dart';
import '../modules/riwayat_pendapatan/bindings/riwayat_pendapatan_binding.dart';
import '../modules/riwayat_pendapatan/views/riwayat_pendapatan_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.RIWAYAT,
      page: () => const RiwayatView(),
      binding: RiwayatBinding(),
    ),
    GetPage(
      name: _Paths.RIWAYAT_PENDAPATAN,
      page: () => const RiwayatPendapatanView(),
      binding: RiwayatPendapatanBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
