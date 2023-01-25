import 'package:flutter/material.dart';
import 'package:panaromic_carousel/panaromic_carousel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: PanaromicCarousel());
  }
}
