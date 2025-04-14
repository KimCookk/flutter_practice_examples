import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/13_http/user_list/pages/user_list_page.dart';
import 'package:flutter_practice_examples/examples/13_http/user_list/providers/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => UserProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: UserListPage(),
    );
  }
}
