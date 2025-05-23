import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/22_wrap/animation_dot_grid_example/animation_dot.dart';
import 'package:flutter_practice_examples/examples/22_wrap/animation_dot_grid_example/animation_dot_grid.dart';
import 'package:flutter_practice_examples/examples/22_wrap/animation_dot_grid_example/animation_dot_grid_state.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final textEditingController = TextEditingController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var state = context.watch<AnimationDotGridState>();

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                SizedBox(
                  width: 100.0,
                  child: TextField(
                    controller: textEditingController,
                    keyboardType: TextInputType.number,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<AnimationDotGridState>().initSet(
                        double.parse(textEditingController.text.trim()));
                    context.read<AnimationDotGridState>().startInitDrawTimer();
                  },
                  child: Icon(Icons.arrow_drop_down_circle_outlined),
                ),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<AnimationDotGridState>()
                        .initSet(state.percent);
                    context.read<AnimationDotGridState>().startInitDrawTimer();
                  },
                  child: Icon(Icons.refresh),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          width: 240,
          child: AnimationDotGrid(),
        ),
      ),
    );
  }
}
