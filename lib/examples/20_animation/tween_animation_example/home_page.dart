import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String key = context.watch<HomePageState>().animationKey!;
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
              key: Key(key),
              tween: Tween(begin: 0.0, end: 100.0),
              duration: Duration(seconds: 2),
              builder: (context, value, child) {
                return Text(value.toStringAsFixed(1));
              },
            )
          ],
        ),
      ),
    );
  }
}
