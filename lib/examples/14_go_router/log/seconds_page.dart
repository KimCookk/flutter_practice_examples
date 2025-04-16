import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SecondsPage extends StatelessWidget {
  const SecondsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Seconds Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.go('/first');
              },
              child: Text('Go First Page'),
            ),
            SizedBox(
              height: 15.0,
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/third');
              },
              child: Text('Go Third Page'),
            ),
            SizedBox(
              height: 15.0,
            ),
            ElevatedButton(
              onPressed: () {
                context.push('/first');
              },
              child: Text('Push First Page'),
            ),
            SizedBox(
              height: 15.0,
            ),
            ElevatedButton(
              onPressed: () {
                context.push('/third');
              },
              child: Text('Push Third Page'),
            ),
            SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}
