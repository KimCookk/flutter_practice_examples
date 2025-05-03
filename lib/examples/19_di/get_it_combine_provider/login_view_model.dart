import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/19_di/get_it_combine_provider/auth_service.dart';
import 'main.dart';

class LoginViewModel extends ChangeNotifier {
  final _auth_service = getIt<AuthService>();

  bool _isLogin = false;
  bool get isLogin => _isLogin;

  Future<void> login(String id, String password) async {
    final result = await _auth_service.login(id, password);
    _isLogin = result;
    notifyListeners();
  }

  void logout() {
    _isLogin = false;
    notifyListeners();
  }
}
