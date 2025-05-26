import 'package:flutter/material.dart';

class CounterNotifier extends ChangeNotifier {
  int _number = 0;

  int get number => _number;

  void increment() {
    _number++;
    notifyListeners();
  }

  void minus() {
    _number--;
    notifyListeners();
  }
}
