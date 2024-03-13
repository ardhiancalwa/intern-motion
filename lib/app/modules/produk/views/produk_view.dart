import 'package:challenge_motion_week_8/app/shared/themes/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_pages.dart';
import '../controllers/produk_controller.dart';

class ProdukView extends GetView<ProdukController> {
  const ProdukView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: accent,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130),
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
            preferredSize: Size.fromHeight(30),
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
                    contentPadding: EdgeInsets.symmetric(horizontal: 20)),
              ),
            ),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: false,
        ),
      ),
      endDrawer: Drawer(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 64,
              ),
              Image.asset(
                'assets/images/profil/profile.png',
                height: 80,
                width: 80,
              ),
              SizedBox(
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
              SizedBox(
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
              SizedBox(
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
                                SizedBox(
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
                                SizedBox(
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
                                SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: BorderSide(
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
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('produk').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
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
            return Center(
              child: Text('No data available'), // Placeholder for empty state
            );
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
      bottomNavigationBar: BottomAppBar(
        height: 55,
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottonHome(),
            BottonProduk(),
            BottonAddProduk(),
            BottonRiwayat(),
            BottonProfile(),
          ],
        ),
      ),
    );
  }
}

class Produk extends StatelessWidget {
  String image;
  String namaProduk;
  String harga;
  Produk({
    super.key,
    required this.image,
    required this.namaProduk,
    required this.harga,
  });

  @override
  Widget build(BuildContext context) {
    final controller = ProdukController();
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                image: DecorationImage(
                  image: AssetImage(image),
                  // fit: BoxFit.contain,
                ),
                color: primaryShade_1,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    namaProduk,
                    style: GoogleFonts.poppins(
                      color: product,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Rp. ${harga.toString()}',
                    style: GoogleFonts.poppins(
                      color: product,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryShade_3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
                        controller.toDetailProdukView();
                      },
                      child: Text(
                        'Detail',
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
          ],
        ),
      ),
    );
  }
}

class BottonAddProduk extends StatelessWidget {
  const BottonAddProduk({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      onPressed: () {
        Get.toNamed(Routes.ADD_PRODUK);
      },
      child: Icon(
        Icons.add,
        color: white,
      ),
    );
  }
}

class BottonProfile extends StatelessWidget {
  const BottonProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.offAllNamed(Routes.PROFILE);
      },
      icon: Icon(
        Icons.person_2_outlined,
        color: primaryColor,
      ),
    );
  }
}

class BottonRiwayat extends StatelessWidget {
  const BottonRiwayat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.offAllNamed(Routes.RIWAYAT);
      },
      icon: Icon(
        Icons.bookmark_border,
        color: primaryColor,
      ),
    );
  }
}

class BottonProduk extends StatelessWidget {
  const BottonProduk({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.offAllNamed(Routes.PRODUK);
      },
      icon: Icon(
        Icons.apple,
        color: primaryColor,
      ),
    );
  }
}

class BottonHome extends StatelessWidget {
  const BottonHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.offAllNamed(Routes.HOME);
      },
      icon: Icon(
        Icons.home,
        color: primaryColor,
      ),
    );
  }
}
