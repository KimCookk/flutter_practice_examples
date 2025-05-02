import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/19_get_it/DI/app_service.dart';
import 'home_page.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main(List<String> args) {
  setupLocator();
  runApp(DependencyIngectionApp());
}

void setupLocator() {
  getIt.registerSingleton<AppService>(AppService());
}

class DependencyIngectionApp extends StatelessWidget {
  const DependencyIngectionApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: HomePage(),
    );
  }
}
