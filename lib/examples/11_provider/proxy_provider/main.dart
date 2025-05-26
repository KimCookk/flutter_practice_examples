import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/11_provider/proxy_provider/counter_notifier.dart';
import 'package:flutter_practice_examples/examples/11_provider/proxy_provider/message_notifier.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CounterNotifier()),
      ChangeNotifierProxyProvider<CounterNotifier, MessageNotifier>(
        update: (context, value, previous) {
          final updateNotifier = previous ?? MessageNotifier();
          updateNotifier.updateMessage(value.number);
          return updateNotifier;
        },
        create: (_) => MessageNotifier(),
      ),
    ],
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: HomePage(),
    );
  }
}
