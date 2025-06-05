import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/23_animation_background/animation_background_page.dart';
import 'package:flutter_practice_examples/examples/23_animation_background/counter_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    child: AnimationBackgroundApp(),
    create: (context) => CounterNotifer(),
  ));
}

class AnimationBackgroundApp extends StatelessWidget {
  const AnimationBackgroundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimationBackgroundPage(),
    );
  }
}
