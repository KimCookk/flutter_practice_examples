import 'package:flutter/material.dart';

class ColumnRowExample extends StatelessWidget {
  const ColumnRowExample({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text("Row 1"),
              Text("Row 2"),
              Text("Row 3"),
              Text("Row 4"),
            ],
          ),
          Column(
            children: [
              Text("Column 1"),
              Text("Column 2"),
              Text("Column 3"),
            ],
          ),
        ],
      ),
    );
  }
}
