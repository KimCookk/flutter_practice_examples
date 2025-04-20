import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/13_http/user_list/models/user_model.dart';
import 'package:flutter_practice_examples/examples/13_http/user_list/providers/user_fetch_state.dart';
import 'package:flutter_practice_examples/examples/13_http/user_list/services/user_service.dart';

class UserProvider extends ChangeNotifier {
  List<User> _users = [];
  List<User> _filteredUsers = [];
  UserFetchState _fetchState = Initial();

  String _query = "";

  List<User> get users => _users;
  List<User> get filteredUsers => _filteredUsers;
  UserFetchState get fetchState => _fetchState;

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
    _fetchState = UserFetchState.loading();
    notifyListeners();
  }

  void setFetchSuccess(List<User> users) {
    _users = users;
    _filteredUsers = users;
    _fetchState = UserFetchState.success(users);
    notifyListeners();
  }

  void setFetchError(String errorMessage) {
    _fetchState = UserFetchState.error(errorMessage);
    notifyListeners();
  }

  void setFiltered(List<User> filteredUsers) {
    _filteredUsers = filteredUsers;
    _fetchState = UserFetchState.success(_filteredUsers);
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
    if (resultUsers.isEmpty) {
      setFetchError("검색 결과 없음");
    } else {
      setFiltered(resultUsers);
    }
  }
}
