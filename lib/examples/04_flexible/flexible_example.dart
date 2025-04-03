import 'package:flutter/material.dart';

class FlexibleExample extends StatelessWidget {
  const FlexibleExample({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.red,
            child: const Center(
              child: Text('2'),
            ),
          ),
        ),
        Spacer(
          flex: 1,
        ),
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.green,
            child: const Center(
              child: Text('1'),
            ),
          ),
        ),
      ],
    );
  }
}
