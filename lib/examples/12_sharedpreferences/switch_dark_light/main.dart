import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/12_sharedpreferences/switch_dark_light/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // 꼭 필요
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomePageState()),
        ChangeNotifierProvider(create: (context) => LoginPageState()),
      ],
      child: MyApp(),
    ),
  );
}

// runApp(ChangeNotifierProvider(
//   create: (context) => HomePageState(),
//   child: MyApp(),
// ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    bool isLightMode = context.watch<HomePageState>().isLightMode;
    return MaterialApp(
      themeMode: isLightMode ? ThemeMode.light : ThemeMode.dark,
      theme: isLightMode ? ThemeData.light() : ThemeData.dark(),
      home: HomePage(),
    );
  }
}
