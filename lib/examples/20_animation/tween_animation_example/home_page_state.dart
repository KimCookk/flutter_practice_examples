import 'package:flutter/material.dart';

class HomePageState extends ChangeNotifier {
  String? _animationKey;

  String? get animationKey => _animationKey;

  HomePageState() {
    setAnimationKey();
  }

  void setAnimationKey() {
    _animationKey = DateTime.now().microsecondsSinceEpoch.toString();
    notifyListeners();
  }
}
