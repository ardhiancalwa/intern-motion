import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/model/riwayat.dart';
import '../../../shared/themes/colors.dart';
import '../../../shared/widgets/bottomNavBar.dart';
import '../controllers/riwayat_pendapatan_controller.dart';

class RiwayatPendapatanView extends GetView<RiwayatPendapatanController> {
  @override
  final controller = Get.put(RiwayatPendapatanController());
  RiwayatPendapatanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: accent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: secondaryShade_3,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.keyboard_backspace_rounded,
            color: white,
          ),
        ),
        title: Text(
          'Riwayat Pendapatan',
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
                    'assets/images/items/kosong.png',
                  ),
                  const SizedBox(
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
                    'Anda belum melakukan penarikan dana',
                    style: GoogleFonts.poppins(
                      color: bottomNav,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
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
                          'assets/images/items/${riwayatItem.image}.png',
                          height: 24,
                          width: 24,
                        ),
                      ),
                      title: Text('Rp. ${riwayatItem.number}',
                          style: GoogleFonts.poppins(
                            color: product,
                            fontSize: 13,
                          )),
                      subtitle: Text(riwayatItem.deskripsi,
                          style: GoogleFonts.poppins(
                            color: bottomNav,
                            fontSize: 12,
                          )),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            riwayatItem.tanggal,
                            style: GoogleFonts.poppins(
                              color: product,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            riwayatItem.jam,
                            style: GoogleFonts.poppins(
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
      // bottomNavigationBar: const BottomPage(),
    );
  }
}
