import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/22_wrap/home_page.dart';
import 'package:flutter_practice_examples/examples/22_wrap/home_page_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => HomePageState(),
      child: WrapExampleApp(),
    ),
  );
}

class WrapExampleApp extends StatelessWidget {
  const WrapExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: HomePage(),
    );
  }
}
