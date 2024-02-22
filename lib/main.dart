import 'package:flutter/material.dart';
import './app/pages/homePage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Raleway',
      ),
      home: const HomeScreenPage(),
    );
  }
}
