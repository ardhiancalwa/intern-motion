import 'package:challenge_motion_week_8/app/modules/home/views/home_view.dart';
import 'package:challenge_motion_week_8/app/modules/produk/views/produk_view.dart';
import 'package:challenge_motion_week_8/app/modules/profile/views/profile_view.dart';
import 'package:challenge_motion_week_8/app/modules/riwayat/views/riwayat_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../shared/themes/colors.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/botton_nav_controller.dart';

class BottonNavView extends GetView<BottonNavController> {
  final BottonNavController controller = Get.put(BottonNavController());
  BottonNavView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.tabIndex.value, // Menggunakan nilai reaktif
          children: [
            HomeView(),
            ProdukView(),
            RiwayatView(),
            ProfileView(), // Placeholder untuk HistoryScreen
            // Tambahkan lebih banyak screen jika diperlukan
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.tabIndex.value, // Menggunakan nilai reaktif
          onTap: controller.changeTabIndex, // Memanggil method controller
          fixedColor: primaryColor,
          showUnselectedLabels: true,
          unselectedItemColor: bottomNav,
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/icons/home-2.png'),
                color: bottomNav,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/icons/harvest.png'),
                color: bottomNav,
              ),
              label: 'Produk',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/icons/transaction-minus.png'),
                color: bottomNav,
              ),
              label: 'Riwayat',
            ),
            // Tambahkan lebih banyak item jika diperlukan
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/icons/harvest.png'),
                color: bottomNav,
              ),
              label: 'Produk',
            ),
          ],
        ),
      ),
    );
  }
}
