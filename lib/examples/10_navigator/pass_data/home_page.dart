import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/10_navigator/pass_data/input_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String _resultText = '';

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
                Navigator.of(context)
                    .push(
                  MaterialPageRoute(
                    builder: (context) => InputPage(),
                  ),
                )
                    .then((value) {
                  setState(() {
                    _resultText = value;
                  });
                });
              },
              child: Text('Push'),
            ),
            Text(
              'Result Value : $_resultText',
            ),
          ],
        ),
      ),
    );
  }
}
