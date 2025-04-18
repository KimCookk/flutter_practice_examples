import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'login_provider.dart';

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
