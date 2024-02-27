import 'package:flutter/material.dart';

import '../themes/colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10), topLeft: Radius.circular(10)),
        // boxShadow: [
        //   BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
        // ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        child: BottomNavigationBar(
            selectedItemColor: primaryColor,
            unselectedItemColor: bottomNav,
            currentIndex: 0,
            backgroundColor: white,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.apple),
                label: 'Produk',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_outline_outlined),
                label: 'Riwayat',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profil',
              ),
            ]),
      ),
    );
  }
}