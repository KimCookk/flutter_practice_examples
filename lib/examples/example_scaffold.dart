import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/main.dart';

class ExampleScaffold extends StatelessWidget {
  final ExampleItem item;

  const ExampleScaffold({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: item.widget,
    );
  }
}
