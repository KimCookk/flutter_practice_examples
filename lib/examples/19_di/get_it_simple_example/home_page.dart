import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/19_get_it/DI/app_service.dart';

import 'main.dart';

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
          children: [
            ElevatedButton(
              onPressed: () {
                final service = getIt<AppService>();
                service.printHello();
              },
              child: Text('DI 실행!'),
            ),
          ],
        ),
      ),
    );
  }
}
