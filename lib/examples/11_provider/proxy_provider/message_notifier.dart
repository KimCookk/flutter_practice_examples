import 'package:flutter/material.dart';

class MessageNotifier extends ChangeNotifier {
  String _message = "zero";

  String get message => _message;

  void updateMessage(int number) {
    if (number < 10) {
      _message = "10보다 작은 수 입니다.";
    } else if (number > 10) {
      _message = "10보다 큰 수 입니다.";
    } else {
      _message = "10과 같은 수 입니다.";
    }
    notifyListeners();
  }
}
