import 'dart:async';

import 'package:flutter/material.dart';

class CounterNotifer extends ChangeNotifier {
  int _number = 20;
  bool _isCompleted = false;
  final bool _isFadeMode = true;

  late Timer _countTimer;

  int get number => _number;
  bool get isCompleted => _isCompleted;
  bool get isFadeMode => _isFadeMode;

  CounterNotifer() {
    start();
  }

  void count() {
    if (_number == 0) {
      _countTimer.cancel();
      _isCompleted = true;
    } else {
      _number--;
    }
    notifyListeners();
  }

  void start() {
    _isCompleted = false;
    _number = 20;
    notifyListeners();

    _countTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      count();
    });
  }

  double getOpacity() {
    return (1 - (_number / 20)).clamp(0.0, 1.0);
  }
}
