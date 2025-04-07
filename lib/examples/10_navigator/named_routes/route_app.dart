import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/10_navigator/named_routes/pages.dart';

class RouteApp extends StatelessWidget {
  const RouteApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      initialRoute: '/a',
      routes: {
        '/a': (context) => APage(),
        '/b': (context) => BPage(),
        '/c': (context) => CPage(),
      },
    );
  }
}
