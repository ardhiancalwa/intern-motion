import 'dart:io';

import 'package:challenge_motion_week_8/app/shared/themes/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/upload_image_controller.dart';

class UploadImageView extends GetView<UploadImageController> {
  const UploadImageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryShade_3,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.keyboard_backspace_rounded,
              color: white,
            )),
        title: Text(
          'Tambahkan Gambar',
          style: GoogleFonts.poppins(
            color: white,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => Column(
          children: <Widget>[
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
                itemCount: controller.listOfImage.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 3.0,
                  crossAxisSpacing: 3.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GridTile(
                    child: Material(
                      child: GestureDetector(
                        child: Stack(
                          children: <Widget>[
                            Obx(
                              () => controller.images.value ==
                                          controller
                                              .listOfImage[index].assetName ||
                                      controller.listOfStr.contains(controller
                                          .listOfImage[index].assetName)
                                  ? Positioned.fill(
                                      child: Opacity(
                                        opacity: 0.7,
                                        child: Image.asset(
                                          controller
                                              .listOfImage[index].assetName,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    )
                                  : Positioned.fill(
                                      child: Opacity(
                                        opacity: 1.0,
                                        child: Image.asset(
                                          controller
                                              .listOfImage[index].assetName,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                            ),
                            Obx(
                              () => controller.images.value ==
                                          controller
                                              .listOfImage[index].assetName ||
                                      controller.listOfStr.contains(controller
                                          .listOfImage[index].assetName)
                                  ? const Positioned(
                                      left: 0,
                                      bottom: 0,
                                      child: Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                      ),
                                    )
                                  : const Visibility(
                                      visible: false,
                                      child: Icon(
                                        Icons.check_circle_outline,
                                        color: Colors.black,
                                      ),
                                    ),
                            ),
                          ],
                        ),
                        onTap: () {
                          controller.onTapImage(index);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: primaryShade_3,
                  ),
                  child: const Text(
                    "Save Images",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    controller.isLoading.value = true;
                    for (String? img in controller.listOfStr) {
                      String imageName = img!
                          .substring(img.lastIndexOf("/"), img.lastIndexOf("."))
                          .replaceAll("/", "");

                      final Directory systemTempDir = Directory.systemTemp;
                      final byteData = await rootBundle.load(img);

                      final file =
                          File('${systemTempDir.path}/$imageName.jpeg');
                      await file.writeAsBytes(byteData.buffer.asUint8List(
                          byteData.offsetInBytes, byteData.lengthInBytes));
                      TaskSnapshot snapshot = await controller.storage
                          .ref()
                          .child("images/$imageName")
                          .putFile(file);
                      if (snapshot.state == TaskState.success) {
                        final String downloadUrl =
                            await snapshot.ref.getDownloadURL();
                        await FirebaseFirestore.instance
                            .collection("produk")
                            .add({"url": downloadUrl, "name": imageName});
                        controller.isLoading.value = false;
                        final snackBar =
                            const SnackBar(content: Text('Yay! Success'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        print(
                            'Error from image repo ${snapshot.state.toString()}');
                        throw ('This file is not an image');
                      }
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
