import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/13_http/user_list/models/user_model.dart';
import 'package:flutter_practice_examples/examples/13_http/user_list/services/user_service.dart';

class UserProvider extends ChangeNotifier {
  List<User> _users = [];
  bool _isLoading = false;
  String _errorMessage = "";

  List<User> get users => _users;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  void setUsers(List<User> users) {
    _users = users;
    notifyListeners();
  }

  void setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void setErrorMessage(String errorMessage) {
    _errorMessage = errorMessage;
    notifyListeners();
  }

  void fetchUsers() async {
    try {
      setIsLoading(true);
      List<User> userList = await UserService().fetch();
      setUsers(userList);
    } catch (e) {
      setErrorMessage(e.toString());
    } finally {
      setIsLoading(false);
    }
  }
}
