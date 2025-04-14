import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool _isLogin = false;

  bool get isLogin => _isLogin;

  setIsLogin(bool isLogin) {
    _isLogin = isLogin;
    notifyListeners();
  }

  void login() {
    setIsLogin(true);
  }

  void logout() {
    setIsLogin(false);
  }
}
