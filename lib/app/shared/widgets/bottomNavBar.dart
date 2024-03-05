import 'package:challenge_motion_week_8/app/routes/app_pages.dart';
import 'package:challenge_motion_week_8/app/shared/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomPage extends StatelessWidget {
  const BottomPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 55,
      color: white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottonHome(),
          BottonProduk(),
          BottonRiwayat(),
          BottonProfile(),
        ],
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
