import 'package:challenge_motion_week_8/app/shared/themes/colors.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final searchController = TextEditingController();
  Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: white,
      ),
      child: Row(
        children: [
          TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'Cari Produk',
              hintStyle: TextStyle(
                color: bottomNav,
                fontSize: 16,
              ),
              fillColor: bottomNav,
              suffixIcon: Icon(
                Icons.search,
                color: bottomNav,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
