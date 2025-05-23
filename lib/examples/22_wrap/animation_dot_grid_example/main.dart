import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/22_wrap/animation_dot_grid_example/animation_dot_grid_state.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AnimationDotGridState(percent: 10.5),
    child: DotGridApp(),
  ));
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
