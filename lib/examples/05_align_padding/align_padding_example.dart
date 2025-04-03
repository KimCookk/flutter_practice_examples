import 'package:flutter/material.dart';

class AlignPaddingExample extends StatelessWidget {
  const AlignPaddingExample({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: SizedBox(
          width: 100,
          height: 40,
          child: ElevatedButton(
            onPressed: () {},
            child: Text("확인"),
          ),
        ),
      ),
    );
  }
}
