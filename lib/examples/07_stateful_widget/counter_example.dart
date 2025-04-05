import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterExample extends StatefulWidget {
  const CounterExample({super.key});

  @override
  State<StatefulWidget> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  int _counter = 0;

  void plus() {
    setState(() {
      _counter++;
    });
  }

  void minus() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // ← 세로축 가운데 정렬!
        children: [
          ElevatedButton(
            onPressed: plus,
            child: Text("Plus"),
          ),
          ElevatedButton(
            onPressed: minus,
            child: Text("Minus"),
          ),
          Text('Counter : $_counter'),
        ],
      ),
    );
  }
}
