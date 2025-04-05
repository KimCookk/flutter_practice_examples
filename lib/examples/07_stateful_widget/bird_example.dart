import 'package:flutter/material.dart';

class BirdExample extends StatefulWidget {
  const BirdExample({super.key});

  @override
  State<BirdExample> createState() => _BirdExampleState();
}

class _BirdExampleState extends State<BirdExample> {
  final GlobalKey<_BirdState> birdKey = GlobalKey<_BirdState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Bird(
          key: birdKey,
          color: Colors.yellow,
          child: const Icon(Icons.flutter_dash, size: 60),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          birdKey.currentState?.grow();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Bird extends StatefulWidget {
  const Bird({
    super.key,
    this.color = const Color(0xFFFFE306),
    this.child,
  });

  final Color color;
  final Widget? child;

  @override
  State<Bird> createState() => _BirdState();
}

class _BirdState extends State<Bird> {
  double _size = 1.0;

  void grow() {
    setState(() {
      _size += 0.1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.diagonal3Values(_size, _size, 1.0),
      alignment: Alignment.center,
      child: Container(
        color: widget.color.withOpacity(0.3),
        padding: const EdgeInsets.all(16),
        child: widget.child,
      ),
    );
  }
}
