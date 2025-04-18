import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/10_navigator/pass_data_2/user_list_page.dart';

void main() {
  runApp(PassDataApp());
}

class PassDataApp extends StatelessWidget {
  const PassDataApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: UserListPage(),
    );
  }
}
