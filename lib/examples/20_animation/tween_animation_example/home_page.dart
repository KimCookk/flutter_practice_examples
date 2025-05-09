import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double _begin = 0.0;
  final double _end = 100.0;
  String key = DateTime.now().millisecondsSinceEpoch.toString();

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
                restart();
              },
              child: Text('Start'),
            ),
            SizedBox(
              height: 20,
            ),
            TweenAnimationBuilder(
              key: Key(key),
              tween: Tween(begin: _begin, end: _end),
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

  void restart() {
    // setState(() {
    //   _end = 0;
    // });
    // Future.delayed(Duration(milliseconds: 1), () {
    //   setState(() {
    //     _end = 100;
    //   });
    // });
    setState(() {
      key = DateTime.now().millisecondsSinceEpoch.toString();
    });
  }
}
