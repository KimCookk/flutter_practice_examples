import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(DotGridApp());
}

class DotGridApp extends StatelessWidget {
  const DotGridApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: HomePage(),
    );
  }
}
