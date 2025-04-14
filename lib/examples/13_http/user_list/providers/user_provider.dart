import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/13_http/user_list/models/user_model.dart';
import 'package:flutter_practice_examples/examples/13_http/user_list/services/user_service.dart';

class UserProvider extends ChangeNotifier {
  List<User> _users = [];
  List<User> _filteredUsers = [];

  bool _isLoading = false;
  String _errorMessage = "";
  String _query = "";

  List<User> get users => _users;
  List<User> get filteredUsers => _filteredUsers;

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  String get query => _query;

  void setUsers(List<User> users) {
    _users = users;
    _filteredUsers = users;
    notifyListeners();
  }

  void setFilteredUsers(List<User> filteredUsers) {
    _filteredUsers = filteredUsers;
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

  void setQuery(String query) {
    _query = query;
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

  void filterUsers() {
    List<User> resultUsers =
        users.where((user) => user.name.contains(query)).toList();
    setFilteredUsers(resultUsers);
  }
}
