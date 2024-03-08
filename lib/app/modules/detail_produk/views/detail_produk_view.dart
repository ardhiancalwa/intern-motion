import 'package:challenge_motion_week_8/app/shared/themes/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/detail_produk_controller.dart';

class DetailProdukView extends GetView<DetailProdukController> {
  const DetailProdukView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: accent,
      appBar: AppBar(
        backgroundColor: secondaryShade_3,
        automaticallyImplyLeading: false,
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
          'Detail Produk',
          style: GoogleFonts.poppins(
            color: white,
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('produk')
            .doc('6KVOoXJd2hh39BGKgcoD')
            .snapshots(),
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
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(
              child: Text(
                  'Document does not exist'), // Placeholder for non-existent document
            );
          }
          final docData = snapshot.data!.data() as Map<String, dynamic>;
          return DetailItems(docData: docData);
        },
      ),
    );
  }
}

class DetailItems extends StatelessWidget {
  final Map<String, dynamic> docData;

  const DetailItems({Key? key, required this.docData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: white,
            height: 200,
            child: Align(
              alignment: Alignment.center,
              child: Image.asset('assets/images/produk/produk1.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: DetailContent(
              namaProduk: docData['name'],
              harga: docData['price'],
              deskripsi: docData['deskripsi'],
              kategori: docData['category'],
              jumlahStok: docData['stok'],
              durasiTahan: docData['durasi'],
              berat: docData['gram'],
            ),
          ),
        ],
      ),
    );
  }
}

class DetailContent extends StatelessWidget {
  final String namaProduk;
  final String harga;
  final String deskripsi;
  final String kategori;
  final String jumlahStok;
  final String durasiTahan;
  final String berat;

  const DetailContent({
    Key? key,
    required this.namaProduk,
    required this.harga,
    required this.deskripsi,
    required this.kategori,
    required this.jumlahStok,
    required this.durasiTahan,
    required this.berat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          namaProduk,
          style: GoogleFonts.poppins(
            color: product,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Rp. ${harga}',
          style: GoogleFonts.poppins(
            color: product,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
        DefaultTabController(
          length: 2, // Number of tabs
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                tabs: [
                  Tab(text: 'Detail'),
                  Tab(text: 'Status'),
                ],
                labelColor: primaryColor,
                unselectedLabelColor: bottomNav,
                indicatorColor: primaryColor,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height:
                    200, // Adjust the height of the tab content area as needed
                child: TabBarView(
                  children: [
                    // Content of the 'Detail' tab
                    SingleChildScrollView(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              deskripsi,
                              style: GoogleFonts.poppins(
                                color: product,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Kategori',
                                      style: GoogleFonts.poppins(
                                        color: primaryColor,
                                        fontSize: 13,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      kategori,
                                      style: GoogleFonts.poppins(
                                        color: product,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 120,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Jumlah',
                                      style: GoogleFonts.poppins(
                                        color: primaryColor,
                                        fontSize: 13,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      jumlahStok,
                                      style: GoogleFonts.poppins(
                                        color: product,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Durasi Tahan',
                                      style: GoogleFonts.poppins(
                                        color: primaryColor,
                                        fontSize: 13,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      durasiTahan,
                                      style: GoogleFonts.poppins(
                                        color: product,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 90,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Berat',
                                      style: GoogleFonts.poppins(
                                        color: primaryColor,
                                        fontSize: 13,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      berat,
                                      style: GoogleFonts.poppins(
                                        color: product,
                                        fontSize: 13,
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
                    Center(
                      child: Text('Status Tab Content'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
