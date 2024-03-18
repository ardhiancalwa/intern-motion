import 'package:challenge_motion_week_8/app/shared/themes/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/widgets/produk_widget.dart';
import '../controllers/produk_controller.dart';

class ProdukView extends GetView<ProdukController> {
  const ProdukView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: accent,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: AppBar(
          primary: true,
          backgroundColor: secondaryShade_3,
          title: Text(
            "List Produk",
            style: GoogleFonts.poppins(
              color: white,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari Produk',
                  hintStyle: GoogleFonts.poppins(
                    color: bottomNav,
                    fontSize: 16,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                  suffixIcon: Image.asset(
                    'assets/icons/search-normal.png',
                    color: bottomNav,
                    height: 12,
                    width: 12,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: false,
        ),
      ),
      endDrawer: Drawer(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 64,
              ),
              Image.asset(
                'assets/images/profil/profile.png',
                height: 80,
                width: 80,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Tan Hijau',
                style: GoogleFonts.poppins(
                  color: product,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Koperasi',
                style: GoogleFonts.poppins(
                  color: product,
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 42,
              ),
              GestureDetector(
                onTap: () {
                  Get.dialog(
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(40),
                        child: Container(
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(46.0),
                            child: Column(
                              children: [
                                Text(
                                  'Logout',
                                  style: GoogleFonts.poppins(
                                    color: product,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  'Apakah Anda yakin untuk logout dari akun ini?',
                                  style: GoogleFonts.poppins(
                                    color: bottomNav,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    decoration: TextDecoration.none,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 14,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    onPressed: () =>
                                        controller.authController.logout(),
                                    child: Text(
                                      'Yes',
                                      style: GoogleFonts.poppins(
                                        color: white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: const BorderSide(
                                          width: double.infinity,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text(
                                      'No',
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.logout,
                      color: primaryColor,
                    ),
                    Text(
                      ' Logout Akun',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: secondaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('produk')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child:
                            CircularProgressIndicator(), // Placeholder for loading state
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    }
                    if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                      return const Center(
                        child: Text(
                            'No data available'), // Placeholder for empty state
                      );
                    }
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 4,
                      ),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot document = snapshot.data!.docs[index];
                        Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;
                        return Produk(
                          image: 'assets/images/produk/produk1.png',
                          harga: data['price'],
                          namaProduk: data['name'],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: RawMaterialButton(
                onPressed: () {
                  Get.toNamed(Routes.ADD_PRODUK);
                },
                elevation: 2.0,
                fillColor: primaryColor,
                padding: const EdgeInsets.all(15.0),
                shape:
                    const CircleBorder(), // Change this to your desired color
                child: const Icon(
                  Icons.add,
                  size: 35.0,
                  color: Colors.white, // Change this to your desired color
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
