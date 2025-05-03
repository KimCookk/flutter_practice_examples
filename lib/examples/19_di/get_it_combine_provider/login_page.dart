import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/19_di/get_it_combine_provider/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController idTextEditingController = TextEditingController();
  final TextEditingController pwTextEditingController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  label: Text('input id'),
                ),
                controller: idTextEditingController,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text('input password'),
                ),
                controller: pwTextEditingController,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<LoginViewModel>().login(
                        idTextEditingController.text,
                        pwTextEditingController.text,
                      );
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
