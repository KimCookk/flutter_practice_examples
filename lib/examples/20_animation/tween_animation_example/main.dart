import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'home_page_state.dart';

void main() {
  runApp(TweenAnimationExampleApp());
}

class TweenAnimationExampleApp extends StatelessWidget {
  const TweenAnimationExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => HomePageState(),
        child: HomePage(),
      ),
    );
  }
}
