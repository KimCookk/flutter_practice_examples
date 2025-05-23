import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/22_wrap/animation_dot_grid_example/animation_dot.dart';
import 'package:flutter_practice_examples/examples/22_wrap/animation_dot_grid_example/animation_dot_grid_state.dart';
import 'package:provider/provider.dart';

class AnimationDotGrid extends StatefulWidget {
  const AnimationDotGrid({super.key});

  @override
  State<StatefulWidget> createState() => DotGridState();
}

class DotGridState extends State<AnimationDotGrid> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AnimationDotGridState>().startInitDrawTimer();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: List.generate(100, (index) {
        return AnimationDot(
          index: index,
        );
      }),
    );
  }
}

// class _AnimationDotGridState extends State<AnimationDotGrid> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     initDrawDotGrid();
//   }

//   @override
//   void didUpdateWidget(covariant AnimationDotGrid oldWidget) {
//     print("didUpdateWidget");
//     super.didUpdateWidget(oldWidget);
//     oldWidget.initDrawTimer?.cancel();
//     oldWidget.updatePercentTimer?.cancel();
//     initDrawDotGrid();
//   }

//   @override
//   Widget build(BuildContext context) {
//     print("buil");
//     // TODO: implement build
//     return Wrap(
//       spacing: 4,
//       runSpacing: 4,
//       children: List.generate(100, (index) {
//         return AnimationDot(
//             opacity: widget.opacities[index],
//             animationKey: widget.animationKey);
//       }),
//     );
//   }

//   void initDrawDotGrid() {
//     widget.initDrawTimer = Timer.periodic(Duration(milliseconds: 100), (timer) {
//       if (widget.index <= widget.percent) {
//         setState(() {
//           widget.opacities[widget.index] = 1.0;
//         });
//         if (widget.index == widget.percent.floor()) {
//           setState(() {
//             widget.opacities[widget.index] =
//                 widget.percent - widget.percent.floor();
//           });
//         }
//         widget.index++;
//       } else {
//         timer.cancel();
//         updatePercent();
//       }
//     });
//   }

//   void updatePercent() {
//     widget.updatePercentTimer =
//         Timer.periodic(Duration(milliseconds: 200), (timer) {
//       if (widget.percent <= 100) {
//         setState(() {
//           int index = widget.percent.ceil();

//           if (index - 1 >= 0 &&
//               widget.opacities.length > index - 1 &&
//               widget.opacities[index - 1] != 1.0) {
//             widget.opacities[index - 1] = 1.0;
//           }

//           if (widget.opacities.length > index) {
//             widget.opacities[index] = widget.percent - widget.percent.floor();
//           }
//         });
//         widget.percent += 0.1;
//       } else {
//         widget.opacities = List.generate(100, (_) {
//           return 0.0;
//         });
//         widget.index = 0;
//         widget.percent = 0;
//         timer.cancel();
//         initDrawDotGrid();
//       }
//     });
//   }

//   // void refresh() {
//   //   widget.opacities = List.generate(100, (_) {
//   //     return 0.0;
//   //   });
//   //   widget.index = 0;
//   //   setState(() {
//   //     widget.animationKey = DateTime.now().millisecondsSinceEpoch.toString();
//   //   });
//   // }
// }
