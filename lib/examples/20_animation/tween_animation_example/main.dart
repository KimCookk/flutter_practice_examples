import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(TweenAnimationExampleApp());
}

class TweenAnimationExampleApp extends StatelessWidget {
  const TweenAnimationExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: HomePage(),
    );
  }
}
