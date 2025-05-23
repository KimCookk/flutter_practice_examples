import 'dart:async';
import 'package:flutter/material.dart';

class AnimationDotGridState extends ChangeNotifier {
  late List<double> _opacities;
  late String _animationKey;
  int _index = 0;
  double _percent;

  Timer? initDrawTimer;
  Timer? updatePercentTimer;

  List<double> get opacities => _opacities;
  String get animationKey => _animationKey;
  int get index => _index;
  double get percent => _percent;

  AnimationDotGridState({required double percent}) : _percent = percent {
    _init();
  }

  void setOpacity(int index, double opacity) {
    opacities[index] = opacity;
  }

  double getOpacity(int index) {
    return opacities[index];
  }

  void _init() {
    _opacities = List.generate(100, (_) {
      return 0.0;
    });
    _animationKey = DateTime.now().millisecondsSinceEpoch.toString();
  }

  void initSet(double percent) {
    stopInitDrawTimer();
    stopUpdatePercentTimer();
    _opacities = List.generate(100, (_) {
      return 0.0;
    });
    _animationKey = DateTime.now().millisecondsSinceEpoch.toString();
    _index = 0;
    _percent = percent;
    notifyListeners();
  }

  void startInitDrawTimer() {
    initDrawTimer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (index <= percent) {
        initDraw();
      } else {
        timer.cancel();
        startUpdatePercentTimer();
      }
    });
  }

  void stopInitDrawTimer() {
    initDrawTimer?.cancel();
  }

  void initDraw() {
    var opacity = 1.0;
    if (index == percent.floor()) {
      opacity = percent - percent.floor();
    }
    setOpacity(index, opacity);
    _index++;
    notifyListeners();
  }

  void startUpdatePercentTimer() {
    updatePercentTimer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      if (percent <= 100) {
        updateDraw();
      } else {
        initSet(0.0);
        timer.cancel();
        startInitDrawTimer();
      }
    });
  }

  void updateDraw() {
    int curIndex = percent.ceil();
    int preIndex = curIndex - 1;

    if (preIndex >= 0 &&
        opacities.length > preIndex &&
        opacities[preIndex] != 1.0) {
      setOpacity(preIndex, 1.0);
    }

    if (opacities.length > curIndex) {
      setOpacity(curIndex, percent - percent.floor());
    }

    _percent += 0.1;
    notifyListeners();
  }

  void stopUpdatePercentTimer() {
    updatePercentTimer?.cancel();
  }
}
