import 'package:flutter/material.dart';

class AnimationDot extends StatelessWidget {
  final double opacity;
  final String animationKey;

  const AnimationDot(
      {super.key, required this.opacity, required this.animationKey});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TweenAnimationBuilder(
      key: ValueKey(animationKey),
      tween: Tween(begin: 0.0, end: opacity),
      duration: Duration(milliseconds: 1000),
      builder: (context, value, child) {
        //print(value);
        return Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: Colors.green.withAlpha(getAlpha(value)),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      },
    );
  }

  int getAlpha(double opacity) {
    return (255 - opacity * 255).round();
  }
}
