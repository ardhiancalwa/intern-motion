import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/model/riwayat.dart';
import '../../../shared/themes/colors.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import '../controllers/riwayat_pendapatan_controller.dart';

class RiwayatPendapatanView extends GetView<RiwayatPendapatanController> {
  const RiwayatPendapatanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: accent,
      appBar: AppBar(
        backgroundColor: secondaryShade_3,
        title: Text(
          'Riwayat Pendapatan',
          style: TextStyle(
            color: white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: controller.riwayatModel.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/isEmpty/kosong.png',
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  Text(
                    'Yah Riwayat Masih Kosong',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Anda belum melakukan penarikan dana',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: bottomNav,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: controller.riwayatModel.length,
              itemBuilder: (context, index) {
                RiwayatModel riwayatItem = controller.riwayatModel[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: white,
                    ),
                    height: 70,
                    child: ListTile(
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: secondaryColor,
                        ),
                        child: Image.asset(
                          'assets/images/produk/${riwayatItem.image}.png',
                          height: 24,
                          width: 24,
                        ),
                      ),
                      title: Text(
                        'Rp. ${riwayatItem.number}',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      subtitle: Text(
                        riwayatItem.deskripsi,
                        style: TextStyle(
                          fontSize: 12,
                          color: bottomNav,
                        ),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            riwayatItem.tanggal,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            riwayatItem.jam,
                            style: TextStyle(
                              color: primaryShade_7,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
