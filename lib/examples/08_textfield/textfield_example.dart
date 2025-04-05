import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextfieldExample extends StatefulWidget {
  const TextfieldExample({super.key});

  @override
  State<StatefulWidget> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextfieldExample> {
  final TextEditingController _controller = TextEditingController();
  String _input = "";

  void changeInput(String input) {
    setState(() {
      _input = input;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_input),
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: _controller,
            onChanged: (value) {
              changeInput(value);
            },
          ),
        ],
      ),
    );
  }
}
