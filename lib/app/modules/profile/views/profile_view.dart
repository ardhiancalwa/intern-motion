import 'package:challenge_motion_week_8/app/shared/themes/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../shared/widgets/bottomNavBar.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final user = FirebaseAuth.instance.currentUser!;
  // CollectionReference users = FirebaseFirestore.instance.collection('users');
  ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
          title: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('users').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); // Placeholder for loading state
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
                  return TittleUser(
                    fullname: data['fullname'],
                    email: data[
                        'email'], // Assuming you want to use email from Firestore document
                    // docId: documentId,
                  );
                }).toList(),
              );
            },
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: white,
              ),
            )
          ],
          centerTitle: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('users').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('Please wait...');
              }
              if (snapshot.hasData == false) {
                return Text('No Data');
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var documents in snapshot.data!.docs)
                    DetailsUser(
                      user: user,
                      fullname: documents.data()['fullname'],
                      email: documents.data()['email'],
                      alamat: documents.data()['alamat'],
                      nomorTelepon: documents.data()['nomor_telepon'],
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
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomPage(),
    );
  }
}

class TittleUser extends StatelessWidget {
  final String fullname;
  final String email;
  const TittleUser({
    super.key,
    required this.fullname,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fullname,
          style: TextStyle(
            color: white,
            fontSize: 15,
          ),
        ),
        Text(
          email,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}

class DetailsUser extends StatelessWidget {
  const DetailsUser({
    super.key,
    required this.user,
    required this.fullname,
    required this.email,
    required this.alamat,
    required this.nomorTelepon,
  });

  final User user;
  final String fullname;
  final String email;
  final String alamat;
  final int nomorTelepon;

  @override
  Widget build(BuildContext context) {
    final controller = ProfileController();
    return Column(
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
          fullname,
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
        SizedBox(
          height: 8,
        ),
        Text(
          email,
          // user.email!,
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
        SizedBox(
          height: 8,
        ),
        Text(
          '********',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () => controller.toNewPassword(),
          child: Text(
            'Ubah Password?',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
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
        SizedBox(
          height: 8,
        ),
        Text(
          alamat,
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
        SizedBox(
          height: 8,
        ),
        Text(
          nomorTelepon.toString(),
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
      ],
    );
  }
}
