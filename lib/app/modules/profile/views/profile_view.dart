import 'package:challenge_motion_week_8/app/shared/themes/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final user = FirebaseAuth.instance.currentUser!;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(user.uid).get(),
      builder: (context, snapshot) {
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: AppBar(
              backgroundColor: secondaryShade_3,
              leading: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CircleAvatar(
                  child: Image.asset(
                    'assets/images/profil/profile.png',
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              leadingWidth: 100,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('nama'),
                  Text(
                    '${data['fullname']}',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 36,
                  ),
                  Text(
                    'Nama Lengkap',
                    style: TextStyle(
                      color: bottomNav,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    user.email!,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Email',
                    style: TextStyle(
                      color: bottomNav,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    user.email!,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Password',
                    style: TextStyle(
                      color: bottomNav,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '********',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Ubah Password?',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Divider(),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Alamat',
                    style: TextStyle(
                      color: bottomNav,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    user.email!,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Nomor Telepon',
                    style: TextStyle(
                      color: bottomNav,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    user.email!,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Divider(),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
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
                                          style: TextStyle(
                                            fontSize: 20,
                                            decoration: TextDecoration.none,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Text(
                                          'Apakah Anda yakin untuk logout dari akun ini?',
                                          style: TextStyle(
                                            fontSize: 12,
                                            decoration: TextDecoration.none,
                                            color: bottomNav,
                                          ),
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
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            onPressed: () => controller
                                                .authController
                                                .logout(),
                                            child: Text(
                                              'Yes',
                                              style: TextStyle(
                                                color: white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
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
                        icon: Icon(
                          Icons.logout,
                          color: primaryColor,
                        ),
                      ),
                      Text(
                        'Logout Akun',
                        style: TextStyle(
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
