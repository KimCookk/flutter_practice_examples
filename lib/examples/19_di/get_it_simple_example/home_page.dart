import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/19_di/get_it_simple_example/app_service.dart';

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                final service = getIt<SigletonService>();
                service.log();
              },
              child: Text('Sigleton 실행!'),
            ),
            ElevatedButton(
              onPressed: () {
                final service = getIt<FactoryService>();
                service.log();
              },
              child: Text('Factory 실행!'),
            ),
          ],
        ),
      ),
    );
  }
}
