import 'package:flutter/material.dart';

class WidgetSizeExample extends StatelessWidget {
  const WidgetSizeExample({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget Size Example"),
      ),
      body: Center(
        // child: Container(
        //   width: 100,
        //   height: 100,
        //   color: Colors.amber,
        //   child: Text("Hello"),
        // ),
        // 부모가 자식에게 크게 제약을 주고, 제약 내 자식은 크기를 결정
        // 크기를 다시 부모가 기반 삼아 자기 크기나 배치를 조정하는 구조
        child: Column(
          children: [
            Container(
              height: 200,
              color: Colors.amber,
              child: ListView(),
            ),
          ],
        ),
      ),
    );
  }
}
