import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/13_http/user_list/models/user_model.dart';
import 'package:flutter_practice_examples/examples/13_http/user_list/services/user_service.dart';

enum UserFetchState {
  inital,
  loading,
  success,
  error,
}

class UserProvider extends ChangeNotifier {
  List<User> _users = [];
  List<User> _filteredUsers = [];
  UserFetchState _fetchState = UserFetchState.inital;

  String _errorMessage = "";
  String _query = "";

  List<User> get users => _users;
  List<User> get filteredUsers => _filteredUsers;
  UserFetchState get fetchState => _fetchState;

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

  void setLoading() {
    _fetchState = UserFetchState.loading;
    notifyListeners();
  }

  void setFetchSuccess(List<User> users) {
    _users = users;
    _filteredUsers = users;
    _fetchState = UserFetchState.success;
    notifyListeners();
  }

  void setFetchError(String errorMessage) {
    _errorMessage = errorMessage;
    _fetchState = UserFetchState.error;
    notifyListeners();
  }

  void setFiltered(List<User> filteredUsers) {
    _filteredUsers = filteredUsers;
    notifyListeners();
  }

  void setQuery(String query) {
    _query = query;
  }

  void fetchUsers() async {
    try {
      setLoading();
      List<User> userList = await UserService().fetch();
      setFetchSuccess(userList);
    } catch (e) {
      setFetchError(e.toString());
    }
  }

  void filterUsers() {
    List<User> resultUsers =
        users.where((user) => user.name.contains(query)).toList();
    setFilteredUsers(resultUsers);
  }
}
