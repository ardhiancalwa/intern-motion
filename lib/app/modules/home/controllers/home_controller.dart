import 'package:challenge_motion_week_8/app/controllers/auth_controller.dart';
import 'package:challenge_motion_week_8/app/data/model/home.dart';
import 'package:challenge_motion_week_8/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../profile/views/profile_view.dart';
import '../../riwayat/views/riwayat_view.dart';
import '../../riwayat_pendapatan/views/riwayat_pendapatan_view.dart';
import '../views/home_view.dart';

class HomeController extends GetxController {
  final authController = Get.find<AuthController>();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  
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
