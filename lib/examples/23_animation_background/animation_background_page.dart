import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/23_animation_background/counter_provider.dart';
import 'package:provider/provider.dart';

class AnimationBackgroundPage extends StatelessWidget {
  const AnimationBackgroundPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final counterNotifier = context.watch<CounterNotifer>();
    String number = counterNotifier.number.toString();
    bool isCompleted = counterNotifier.isCompleted;
    bool isFadeMode = counterNotifier.isFadeMode;
    double opacity = counterNotifier.getOpacity();

    return Scaffold(
      body: Stack(
        children: [
          isFadeMode
              ? Positioned.fill(
                  child: AnimatedOpacity(
                    opacity: opacity,
                    duration: Duration(seconds: 1),
                    child: Image.asset(
                      'assets/images/flower.webp',
                      fit: BoxFit.cover,
                      gaplessPlayback: false,
                    ),
                  ),
                )
              : isCompleted
                  ? Positioned.fill(
                      child: Image.asset(
                        'assets/images/flower.webp',
                        fit: BoxFit.cover,
                        gaplessPlayback: false,
                        key: ValueKey(
                          DateTime.now().microsecondsSinceEpoch.toString(),
                        ),
                      ),
                    )
                  : Container(
                      color: Colors.white,
                    ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  number,
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                ElevatedButton(
                  onPressed: isCompleted
                      ? () {
                          context.read<CounterNotifer>().start();
                        }
                      : null,
                  child: Text('Start'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
