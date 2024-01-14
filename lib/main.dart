import 'package:flutter/material.dart';
import 'package:adhiancalwanugraha_motionintern_week_1/product_detail.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: new productDetail(),
    );
  }
}