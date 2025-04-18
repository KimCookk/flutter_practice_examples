import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<LoginProvider>().login();
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
