import 'package:challenge_motion_week_8/app/controllers/landing_page_controller.dart';
import 'package:challenge_motion_week_8/app/shared/themes/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/widgets/bottomNavBar.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  final controller = Get.put(HomeController());
  final user = FirebaseAuth.instance.currentUser!;
  final _pendapatanController = TextEditingController();
  final landingPageController = LandingPageController();

  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: accent,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          backgroundColor: secondaryShade_3,
          automaticallyImplyLeading: false,
          title: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('users').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(); // Placeholder for loading state
              }
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  // String documentId = document.id;
                  return TitleUser(
                    fullname: data[
                        'fullname'], // Assuming you want to use email from Firestore document
                    // docId: documentId,
                  );
                }).toList(),
              );
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                'assets/images/profil/${controller.homeModel.image}.png',
              ),
            )
          ],
          centerTitle: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: white),
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Pendapatan',
                                  style: GoogleFonts.poppins(
                                    color: product,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text(
                                'Rp.${controller.homeModel.pendapatan.toString()}',
                                style: GoogleFonts.poppins(color: product),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () => controller.toRiwayatPendapatanView(),
                            child: Text('Lihat Riwayat',
                                style: GoogleFonts.poppins(
                                  color: primaryColor,
                                  fontSize: 14,
                                )),
                          )
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryShade_3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            Get.bottomSheet(
                              Container(
                                height: 237,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  color: white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 19, vertical: 28),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'From Tarik Pendapatan ',
                                        style: GoogleFonts.poppins(
                                          color: product,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Catatan : ',
                                          style: GoogleFonts.poppins(
                                            color: product,
                                            fontSize: 10,
                                          ),
                                          children: [
                                            TextSpan(
                                                text:
                                                    'Nominal tidak lebih dari ',
                                                style: GoogleFonts.poppins(
                                                  color: product,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            TextSpan(
                                              text: 'Pemasukan',
                                              style: GoogleFonts.poppins(
                                                color: primaryColor,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        keyboardType: TextInputType.number,
                                        controller: _pendapatanController,
                                        decoration: InputDecoration(
                                          hintText: '8000',
                                          hintStyle: GoogleFonts.poppins(
                                            color: product,
                                            fontSize: 16,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                              color: bottomNav,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                              color: bottomNav,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: primaryShade_3,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                5,
                                              ),
                                            ),
                                          ),
                                          onPressed: () {
                                            Get.back();
                                            Get.dialog(
                                              transitionDuration:
                                                  const Duration(
                                                milliseconds: 500,
                                              ),
                                              Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      20.0),
                                                  child: Container(
                                                    height: 275,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        20,
                                                      ),
                                                      color: white,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15.0),
                                                      child: Column(
                                                        children: [
                                                          Image.asset(
                                                            'assets/images/items/success.png',
                                                            height: 166,
                                                            width: 260,
                                                          ),
                                                          const SizedBox(
                                                            height: 3,
                                                          ),
                                                          Text(
                                                            'Berhasil tarik uang',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color: product,
                                                              fontSize: 16,
                                                              decoration:
                                                                  TextDecoration
                                                                      .none,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            'Berhasil tarik dana, estimasi pencairan 2-7 hari, jangan lupa cek notifikasi',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color: bottomNav,
                                                              fontSize: 12,
                                                              decoration:
                                                                  TextDecoration
                                                                      .none,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'Tarik',
                                            style: GoogleFonts.poppins(
                                              color: white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Text('Tarik Pendapatan',
                              style: GoogleFonts.poppins(
                                color: white,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Statistik',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 100,
                        width: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              controller.homeModel.produkDiterima.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Produk Diterima',
                              style: TextStyle(
                                fontSize: 16,
                                color: bottomNav,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              controller.homeModel.produkDiproses.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Produk Diproses',
                              style: TextStyle(
                                fontSize: 16,
                                color: bottomNav,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomPage(),
    );
  }
}

class TitleUser extends StatelessWidget {
  String fullname;
  TitleUser({
    super.key,
    required this.fullname,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Selamat Datang',
            style: GoogleFonts.poppins(
              color: white,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(fullname,
              style: GoogleFonts.poppins(
                color: white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
    );
  }
}
