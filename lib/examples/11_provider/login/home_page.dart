import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/14_multi_provider/login_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<LoginProvider>().logout();
              },
              child: Text('LogOut'),
            ),
          ],
        ),
      ),
    );
  }
}
