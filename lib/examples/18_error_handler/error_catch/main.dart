import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runZonedGuarded(() {
    FlutterError.onError = (details) {
      FlutterError.presentError(details);
    };

    runApp(RunApp());
  }, (error, stackTrace) {
    print('전역 에러 발생 : $error');
  });
}

class RunApp extends StatelessWidget {
  const RunApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Error Catch Example,'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                try {
                  throw Exception('Error Exception');
                } catch (e) {
                  print(e.toString());
                }
              },
              child: Text('try-catch'),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                Future.delayed(Duration(seconds: 1), () {
                  // try-catch 없이 예외 발생!
                  throw Exception('Error');
                });
              },
              child: Text('Global Error'),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                makeError();
              },
              child: Text('FlutterError onError'),
            ),
          ],
        ),
      ),
    );
  }

  void makeError() {
    final list = ['a'];
    for (var n = 0; n < list.length + 1; n++) {
      print(list[n]);
    }
  }
}
