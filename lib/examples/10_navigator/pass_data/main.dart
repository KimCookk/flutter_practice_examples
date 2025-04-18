import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(PassDataApp());
}

class PassDataApp extends StatelessWidget {
  const PassDataApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: HomePage(),
    );
  }
}
