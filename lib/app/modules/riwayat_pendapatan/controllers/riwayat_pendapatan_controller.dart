import 'package:get/get.dart';

import '../../../data/model/riwayat.dart';

class RiwayatPendapatanController extends GetxController {
  List<RiwayatModel> riwayatModel = [];

  @override
  void onInit() {
    loadRiwayatModel();
    super.onInit();
  }

  void loadRiwayatModel() {
    riwayatModel = [
      RiwayatModel(
        image: 'wallet-white',
        namaProduk: 'Produk Brokoli',
        deskripsi: 'Pendapatan Uang Berhasil Ditarik',
        tanggal: 'Sep 27',
        jam: '10.57',
        number: 140000,
      ),
      RiwayatModel(
        image: 'wallet-white',
        namaProduk: 'Produk Brokoli',
        deskripsi: 'Pendapatan Uang Berhasil Ditarik',
        tanggal: 'Sep 27',
        jam: '10.57',
        number: 300000,
      ),
    ];
  }
}
