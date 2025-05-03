import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/19_di/get_it_combine_provider/login_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        leading: BackButton(
          onPressed: () {
            context.read<LoginViewModel>().logout();
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Hello !'),
          ],
        ),
      ),
    );
  }
}
