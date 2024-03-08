import 'package:challenge_motion_week_8/app/shared/themes/colors.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
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
              Text('Brokoli'),
              Text('Rp. 14.000'),
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
                                  Text('Produk Fresh dan menyenangkan'),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Kategori'),
                                          Text('Sayuran'),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text('Jumlah'),
                                          Text('Sayuran'),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text('Durasi Tahan'),
                                          Text('5 hari'),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text('Berat'),
                                          Text('500 gram'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Content of the 'Status' tab
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
          ),
        ),
      ),
    );
  }
}
