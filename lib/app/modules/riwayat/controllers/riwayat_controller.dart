import 'package:challenge_motion_week_8/app/data/model/riwayat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RiwayatController extends GetxController {
  List<RiwayatModel> riwayatModel = [];

  @override
  void onInit() {
    loadRiwayatModel();
    super.onInit();
  }

  void loadRiwayatModel() {
    riwayatModel = [
      RiwayatModel(
        image: 'brokoli',
        namaProduk: 'Produk Brokoli',
        deskripsi: 'Permintaan Berhasil Dilakukan',
        tanggal: 'Sep 27',
        jam: '10.57',
      ),
      RiwayatModel(
        image: 'brokoli',
        namaProduk: 'Produk Brokoli',
        deskripsi: 'Permintaan Berhasil Dilakukan',
        tanggal: 'Sep 27',
        jam: '10.57',
      ),
    ];
  }
}
