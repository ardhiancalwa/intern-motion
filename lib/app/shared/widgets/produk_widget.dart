import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../modules/produk/controllers/produk_controller.dart';
import '../themes/colors.dart';

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
      padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
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
                borderRadius: const BorderRadius.only(
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
              padding: const EdgeInsets.all(10),
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
                  const SizedBox(
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