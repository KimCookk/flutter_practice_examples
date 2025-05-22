import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/22_wrap/animation_dot_grid_example/animation_dot.dart';
import 'package:flutter_practice_examples/examples/22_wrap/animation_dot_grid_example/animation_dot_grid.dart';

class HomePage extends StatefulWidget {
  final textEditingController = TextEditingController();

  String animationKey = DateTime.now().millisecondsSinceEpoch.toString();
  List<double> opacities = List.generate(100, (_) {
    return 0.0;
  });
  int index = 0;
  double percent = 10.5;

  HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
                    controller: widget.textEditingController,
                    keyboardType: TextInputType.number,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.opacities = List.generate(100, (_) {
                      return 0.0;
                    });
                    widget.index = 0;
                    widget.percent =
                        double.parse(widget.textEditingController.text.trim());
                    setState(() {
                      widget.animationKey =
                          DateTime.now().millisecondsSinceEpoch.toString();
                    });
                  },
                  child: Icon(Icons.arrow_drop_down_circle_outlined),
                ),
                ElevatedButton(
                  onPressed: () {
                    print("refresh");
                    widget.opacities = List.generate(100, (_) {
                      return 0.0;
                    });
                    widget.index = 0;
                    setState(() {
                      widget.animationKey =
                          DateTime.now().millisecondsSinceEpoch.toString();
                    });
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
          child: AnimationDotGrid(
            opacities: widget.opacities,
            animationKey: widget.animationKey,
            index: widget.index,
            percent: widget.percent,
          ),
        ),
      ),
    );
  }
}
