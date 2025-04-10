import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/11_provider/counter/counter_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: ChangeNotifierProvider(
      create: (_) => CounterState(),
      child: CounterPage(),
    ));
  }
}
