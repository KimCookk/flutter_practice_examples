import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/19_di/get_it_simple_example/app_service.dart';
import 'home_page.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main(List<String> args) {
  setupLocator();
  runApp(DependencyIngectionApp());
}

void setupLocator() {
  getIt.registerSingleton<AppService>(AppService());
  getIt.registerLazySingleton<SigletonService>(() => SigletonService());
  getIt.registerFactory<FactoryService>(() => FactoryService());
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
