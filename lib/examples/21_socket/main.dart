import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/21_socket/home_page.dart';
import 'package:flutter_practice_examples/examples/21_socket/home_page_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(RunApp());
}

class RunApp extends StatelessWidget {
  const RunApp({super.key});

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
