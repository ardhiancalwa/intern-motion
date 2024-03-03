import 'package:challenge_motion_week_8/app/modules/home/views/home_view.dart';
import 'package:challenge_motion_week_8/app/modules/profile/views/profile_view.dart';
import 'package:challenge_motion_week_8/app/modules/riwayat/views/riwayat_view.dart';
import 'package:challenge_motion_week_8/app/modules/riwayat_pendapatan/views/riwayat_pendapatan_view.dart';
import 'package:challenge_motion_week_8/app/shared/themes/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/navbar_controller.dart';

class NavbarView extends GetView<NavbarController> {
  final controller = Get.put(NavbarController());
  NavbarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavbarController>(builder: (context) {
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex.value,
          children: [
            HomeView(),
            RiwayatPendapatanView(),
            RiwayatView(),
            ProfileView(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: primaryColor,
          unselectedItemColor: bottomNav,
          currentIndex: controller.tabIndex.value,
          showUnselectedLabels: true,
          onTap: controller.changeTabIndex,
          items: [
            _bottomBarItem(Icons.home, 'Home'),
            _bottomBarItem(Icons.apple, 'Produk'),
            _bottomBarItem(Icons.bookmark, 'Riwayat'),
            _bottomBarItem(Icons.person_2_outlined, 'Profile'),
          ],
        ),
      );
    });
  }
}

_bottomBarItem(IconData icon, String label) {
  return BottomNavigationBarItem(
    icon: Icon(icon),
    label: label,
  );
}
