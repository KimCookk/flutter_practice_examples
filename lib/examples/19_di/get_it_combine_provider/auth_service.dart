class AuthService {
  final Map<String, String> memberInfos = {'test': 'test123!'};

  Future<bool> login(String id, String password) async {
    await Future.delayed(Duration(seconds: 1));
    if (memberInfos.keys.contains(id)) {
      if (password == memberInfos[id]) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
