import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Counter Example",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CounterText(),
            SizedBox(
              height: 30,
            ),
            ButtonRow(),
          ],
        ),
      ),
    );
  }
}

class CounterState extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void plus() {
    _count++;
    notifyListeners();
  }

  void minus() {
    if (_count > 0) {
      _count--;
      notifyListeners();
    }
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final counter = context.watch<CounterState>().count;
    return Text(
      '$counter',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ButtonRow extends StatelessWidget {
  const ButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            context.read<CounterState>().minus();
          },
          child: Text("-"),
        ),
        SizedBox(
          width: 30,
        ),
        ElevatedButton(
          onPressed: () {
            context.read<CounterState>().plus();
          },
          child: Text("+"),
        ),
      ],
    );
  }
}
