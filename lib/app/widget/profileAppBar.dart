import 'package:flutter/material.dart';
import '../pages/profilePage.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const ProfileScreenPage()),
        );
      },
      child: const CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage("assets/images/calwa.png"),
      ),
    );
  }
}