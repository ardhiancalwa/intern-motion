import 'package:challenge_motion_week_8/app/routes/app_pages.dart';
import 'package:challenge_motion_week_8/app/shared/themes/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamStatus => auth.authStateChanges();

  Future<bool> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAllNamed(Routes.BOTTON_NAV);
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null) {
          print(user.uid);
        }
      });
      return true;
    } catch (error) {
      print('Error during sign-in: $error');
      return false; // Sign-in failed
    }
  }

  void updateUserData(String userId, String fullname, String alamat,
      int nomorTelepon, String email) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'fullname': fullname,
        'email': email,
        'alamat': alamat,
        'nomor_telepon': nomorTelepon,
      });
      print('User data updated successfully.');
    } catch (e) {
      print('Error updating user data: $e');
    }
  }

  void reauthenticateUser(String oldPassword, String newPassword) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Re-authenticate user before updating password
        AuthCredential credential = EmailAuthProvider.credential(
          email: user.email!,
          password: oldPassword,
        );
        await user.reauthenticateWithCredential(credential);

        // Update password
        await user.updatePassword(newPassword);

        Get.snackbar(
          'Success',
          'Password updated successfully',
          backgroundColor: primaryColor.withOpacity(0.5),
          colorText: white,
        );
      } else {
        Get.snackbar(
          'Error',
          'User not found',
          backgroundColor: error.withOpacity(0.5),
          colorText: white,
        );
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void signUp(String email, String password, String fullname, String alamat,
      int nomorTelepon) async {
    try {
      Get.offAllNamed(Routes.BOTTON_NAV);
      await FirebaseFirestore.instance.collection('users').add({
        'fullname': fullname,
        'email': email,
        'alamat': alamat,
        'nomor_telepon': nomorTelepon,
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> addProduk(String name, String harga, String kategori,
      String stok, String durasiTahan, String deskripsi, String gram) async {
    try {
      await FirebaseFirestore.instance.collection('produk').add({
        'name': name,
        'price': harga,
        'category': kategori,
        'stok': stok,
        'durasi': durasiTahan,
        'deskripsi': deskripsi,
        'gram': gram,
      });
      Get.offAllNamed(Routes.PRODUK);
      return true; // Sign-up produk successful
    } catch (e) {
      print('Error during sign-up produk: $e');
      // Handle specific error cases if needed
      return false; // Sign-up produk failed
    }
  }

  List<String> docIds = [];

  Future getDocId() async {
    await FirebaseFirestore.instance.collection('users').get().then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              print(document.reference);
              docIds.add(document.reference.id);
            },
          ),
        );
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
