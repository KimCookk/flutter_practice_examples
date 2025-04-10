import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/10_navigator/bottom_bar/navigator_bottom_bar_example.dart';
import 'package:flutter_practice_examples/examples/11_provider/bottom_navi/bottom_nav_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => BottomNavState(),
      child: ProviderApp(),
    ),
  );
}

class ProviderApp extends StatelessWidget {
  const ProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: NavigatorBottomBarExample(),
    );
  }
}
