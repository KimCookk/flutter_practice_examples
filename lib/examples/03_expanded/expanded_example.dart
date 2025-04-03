import 'package:flutter/material.dart';

class ExpandedExample extends StatelessWidget {
  const ExpandedExample({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ExpandedExample"),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            color: Colors.amber,
            child: Center(
              child: Text("고정 높이 영역"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              color: Colors.blue,
              child: Center(
                child: Text("Expanded로 남은 공간 채움"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
