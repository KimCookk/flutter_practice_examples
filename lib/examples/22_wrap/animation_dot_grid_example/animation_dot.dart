import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/22_wrap/animation_dot_grid_example/animation_dot_grid_state.dart';
import 'package:provider/provider.dart';

class AnimationDot extends StatelessWidget {
  final int index;

  const AnimationDot({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var state = context.watch<AnimationDotGridState>();
    String animationKey = state.animationKey;
    double opacity = state.getOpacity(index);

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
