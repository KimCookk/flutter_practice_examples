import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/11_provider/proxy_provider/counter_notifier.dart';
import 'package:flutter_practice_examples/examples/11_provider/proxy_provider/message_notifier.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterNotifier = context.watch<CounterNotifier>();
    final messageNotifier = context.watch<MessageNotifier>();

    var counter = counterNotifier.number;
    var message = messageNotifier.message;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // counter notifier minus
                    context.read<CounterNotifier>().minus();
                  },
                  child: Text('-'),
                ),
                SizedBox(
                  width: 20,
                ),
                Text('$counter'),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    // counter notifier plus
                    context.read<CounterNotifier>().increment();
                  },
                  child: Text('+'),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(message),
          ],
        ),
      ),
    );
  }
}
