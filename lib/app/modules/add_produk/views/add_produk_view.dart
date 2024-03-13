import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../shared/themes/colors.dart';
import '../controllers/add_produk_controller.dart';

class AddProdukView extends GetView<AddProdukController> {
  AddProdukView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: accent,
      appBar: AppBar(
        backgroundColor: secondaryShade_3,
        title: Text(
          'Tambahkan Produk',
          style: TextStyle(
            color: white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Foto Produk',
              ),
              Container(
                height: 72,
                width: 76,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: white,
                ),
                child: GestureDetector(
                  onTap: () {
                    controller.toUploadImageView();
                  },
                  child: const Icon(
                    Icons.camera_alt_outlined,
                    size: 24,
                  ),
                ),
              ),
              InputText(
                controller: controller,
                tittle: 'Nama Produk',
                keyboard: TextInputType.text,
                textEditingController: controller.namaProdukController,
              ),
              InputText(
                controller: controller,
                tittle: 'Deskripsi',
                keyboard: TextInputType.text,
                textEditingController: controller.deskripsiController,
              ),
              InputText(
                controller: controller,
                tittle: 'Kategori',
                keyboard: TextInputType.text,
                textEditingController: controller.kategoriController,
              ),
              InputText(
                controller: controller,
                tittle: 'Harga',
                keyboard: TextInputType.number,
                textEditingController: controller.hargaController,
              ),
              InputText(
                controller: controller,
                tittle: 'Jumlah',
                keyboard: TextInputType.number,
                textEditingController: controller.jumlahController,
              ),
              InputText(
                controller: controller,
                tittle: 'Durasi Tahan',
                keyboard: TextInputType.text,
                textEditingController: controller.durasiController,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Berat',
                style: TextStyle(
                  color: product,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              RichText(
                text: TextSpan(
                  text: 'Dalam ',
                  style: TextStyle(color: product),
                  children: [
                    TextSpan(
                      text: 'gram ',
                      style: TextStyle(color: primaryColor),
                    ),
                    TextSpan(
                      text: '(contoh: 500 gr untuk ikat)',
                      style: TextStyle(
                        color: bottomNav,
                      ),
                    )
                  ],
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: controller.beratController,
                decoration: InputDecoration(
                  fillColor: bottomNav,
                  focusColor: bottomNav,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: bottomNav),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: bottomNav,
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
                    backgroundColor: primaryShade_3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {
                    controller.authController
                        .addProduk(
                      controller.namaProdukController.text,
                      controller.hargaController.text,
                      controller.kategoriController.text,
                      controller.jumlahController.text,
                      controller.durasiController.text,
                      controller.deskripsiController.text,
                      controller.beratController.text,
                    )
                        .then((signUpProdukSuccess) {
                      if (signUpProdukSuccess != "") {
                        // If signUpProdukSuccess is empty, it means sign up was successful
                        Get.snackbar(
                          'Success',
                          'Produk berhasil ditambahkan',
                          backgroundColor: white.withOpacity(0.5),
                          colorText: primaryColor,
                          duration: const Duration(seconds: 3),
                          animationDuration: const Duration(seconds: 1),
                        );
                      }
                    }).catchError((error) {
                      print('Error during sign up produk: $error');
                      Get.snackbar(
                        'Error',
                        'Terjadi kesalahan saat menambahkan produk. Silakan coba lagi.',
                        backgroundColor: error.withOpacity(0.1),
                        colorText: error,
                        duration: const Duration(seconds: 4),
                        animationDuration: const Duration(seconds: 1),
                      );
                    });
                  },
                  child: Text(
                    'Kirim',
                    style: TextStyle(color: white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputText extends StatelessWidget {
  final String tittle;
  final TextInputType keyboard;
  final TextEditingController textEditingController;
  const InputText({
    super.key,
    required this.controller,
    required this.tittle,
    required this.keyboard,
    required this.textEditingController,
  });

  final AddProdukController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboard,
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: tittle,
        labelStyle: TextStyle(
          color: product,
          fontWeight: FontWeight.bold,
        ),
        fillColor: bottomNav,
        focusColor: bottomNav,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: bottomNav),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: bottomNav,
          ),
        ),
      ),
    );
  }
}
