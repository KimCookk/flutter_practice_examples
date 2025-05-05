import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/19_di/get_it_combine_provider/auth_service.dart';
import 'main.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthService _authService;

  LoginViewModel(this._authService);

  bool _isLogin = false;
  bool get isLogin => _isLogin;

  Future<void> login(String id, String password) async {
    final result = await _authService.login(id, password);
    _isLogin = result;
    notifyListeners();
  }

  void logout() {
    _isLogin = false;
    notifyListeners();
  }
}
