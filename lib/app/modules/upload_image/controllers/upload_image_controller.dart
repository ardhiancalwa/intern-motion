import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UploadImageController extends GetxController {
  var storage = FirebaseStorage.instance;
  var listOfImage = <AssetImage>[].obs;
  var clicked = false.obs;
  var listOfStr = <String?>[].obs;
  var images = ''.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getImages();
  }

  void getImages() {
    listOfImage.clear();
    for (int i = 1; i < 5; i++) {
      listOfImage.add(AssetImage('assets/images/produk/produk$i.png'));
    }
  }

  void onTapImage(int index) {
    if (listOfStr.contains(listOfImage[index].assetName)) {
      clicked.value = false;
      listOfStr.remove(listOfImage[index].assetName);
      images.value = '';
    } else {
      images.value = listOfImage[index].assetName;
      listOfStr.add(images.value);
      clicked.value = true;
    }
  }

  Future<void> uploadImagesToFirestore() async {
    isLoading.value = true;
    for (String? img in listOfStr) {
      String imageName = img!
          .substring(img.lastIndexOf("/"), img.lastIndexOf("."))
          .replaceAll("/", "");

      final Directory systemTempDir = Directory.systemTemp;
      final byteData = await rootBundle.load(img);

      final file = File('${systemTempDir.path}/$imageName.jpeg');
      await file.writeAsBytes(byteData.buffer.asUint8List(
          byteData.offsetInBytes, byteData.lengthInBytes));
      TaskSnapshot snapshot = await storage
          .ref()
          .child("images/$imageName")
          .putFile(file);
      if (snapshot.state == TaskState.success) {
        final String downloadUrl = await snapshot.ref.getDownloadURL();
        await FirebaseFirestore.instance
            .collection("produk")
            .add({"url": downloadUrl, "name": imageName});
        isLoading.value = false;
        final snackBar = SnackBar(content: Text('Yay! Success'));
        ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
      } else {
        print('Error from image repo ${snapshot.state.toString()}');
        throw ('This file is not an image');
      }
    }
  }
}
