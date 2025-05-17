import 'package:flutter/material.dart';

class HomePageState extends ChangeNotifier {
  String? _textAnimationKey;
  String? _opacityAnimationKey;
  double opacity = 0.0;

  String? get textAnimationKey => _textAnimationKey;
  String? get opacityAnimationKey => _opacityAnimationKey;

  HomePageState() {
    setAnimationKey();
  }

  void setAnimationKey() {
    _textAnimationKey = DateTime.now().microsecondsSinceEpoch.toString();
    _opacityAnimationKey = DateTime.now().microsecondsSinceEpoch.toString();
    notifyListeners();
  }
}
