import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String textAnimationkey = context.watch<HomePageState>().textAnimationKey!;
    String opacityAnimationkey =
        context.watch<HomePageState>().opacityAnimationKey!;
    //double opacity = context.watch<HomePageState>().opacity;

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
                context.read<HomePageState>().setAnimationKey();
              },
              child: Text('Start'),
            ),
            SizedBox(
              height: 20,
            ),
            TweenAnimationBuilder(
              key: ValueKey(textAnimationkey),
              tween: Tween(begin: 0.0, end: 100.0),
              duration: Duration(seconds: 10),
              builder: (context, value, child) {
                return Text(value.toStringAsFixed(1));
              },
            ),
            SizedBox(
              height: 20,
            ),
            TweenAnimationBuilder(
              key: ValueKey(opacityAnimationkey),
              tween: Tween(begin: 0.0, end: 0.5),
              duration: Duration(seconds: 10),
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: Text(
                    'Opacity Test',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
