import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/14_multi_provider/login_page.dart';
import 'package:flutter_practice_examples/examples/14_multi_provider/home_page.dart';
import 'package:flutter_practice_examples/examples/14_multi_provider/login_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => LoginProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLogin = context.watch<LoginProvider>().isLogin;
    // TODO: implement build
    return MaterialApp(
      home: isLogin ? HomePage() : LoginPage(),
    );
  }
}
