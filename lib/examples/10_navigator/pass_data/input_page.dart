// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class InputPage extends StatelessWidget {
  // StatelessWidget에서 mutable field 사용은 피해야한다.
  // String inputText = '';
  final TextEditingController _controller = TextEditingController();
  InputPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _controller.text);
              },
              child: Text('Pop'),
            )
          ],
        ),
      ),
    );
  }
}
