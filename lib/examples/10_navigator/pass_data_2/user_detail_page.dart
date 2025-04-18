import 'package:flutter/material.dart';

class UserDetailPage extends StatelessWidget {
  final String name;
  final String email;
  final int age;

  const UserDetailPage({
    super.key,
    required this.name,
    required this.email,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name : $name'),
            SizedBox(
              height: 15,
            ),
            Text('Email : $email'),
            SizedBox(
              height: 15,
            ),
            Text('age : $age'),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
