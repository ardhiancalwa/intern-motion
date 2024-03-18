import 'package:challenge_motion_week_8/app/shared/themes/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/model/riwayat.dart';
import '../../../shared/widgets/bottomNavBar.dart';
import '../controllers/riwayat_controller.dart';

class RiwayatView extends GetView<RiwayatController> {
  final controller = Get.put(RiwayatController());
  RiwayatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: accent,
      appBar: AppBar(
        backgroundColor: secondaryShade_3,
        title: Text(
          'Riwayat Permintaan',
          style: GoogleFonts.poppins(
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
                    style: GoogleFonts.poppins(
                      color: product,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Anda belum melakukan penambahan permintaan',
                    style: GoogleFonts.poppins(
                      color: bottomNav,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
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
                          color: primaryShade_1,
                        ),
                        child: Image.asset(
                          'assets/images/produk/${riwayatItem.image}.png',
                        ),
                      ),
                      title: Text(
                        riwayatItem.namaProduk,
                        style: GoogleFonts.poppins(
                          color: product,
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                        ),
                      ),
                      subtitle: Text(
                        riwayatItem.deskripsi,
                        style: GoogleFonts.poppins(
                          color: bottomNav,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            riwayatItem.tanggal,
                            style: GoogleFonts.poppins(
                              color: product,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            riwayatItem.jam,
                            style: TextStyle(
                              color: bottomNav,
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
      // bottomNavigationBar: BottomPage(),
    );
  }
}
