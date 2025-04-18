import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageState extends ChangeNotifier {
  bool _isLightMode = true;

  // Type을 명시하는 쪽이 좋다.
  bool get isLightMode => _isLightMode;

  HomePageState() {
    _loadModel();
  }

  void _loadModel() async {
    final prefs = await SharedPreferences.getInstance();
    _isLightMode = prefs.getBool("isLightMode") ?? true;

    // 비동기처리 notifyListeners() 처리가 필수적이다.
    // 타이밍상으로 값은 바뀌었지만, View에서 인식을 못 할 수 있음.
    notifyListeners();
  }

  void toggleMode() async {
    _isLightMode = !_isLightMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isLightMode", _isLightMode);
    notifyListeners();
  }
}

class LoginPageState extends ChangeNotifier {
  bool _isLogin = false;

  bool get isLogin => _isLogin;

  void login() {
    _isLogin = true;
    notifyListeners();
  }

  void logout() {
    _isLogin = false;
    notifyListeners();
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLightMode = context.watch<HomePageState>().isLightMode;
    bool isLogin = context.watch<LoginPageState>().isLogin;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Switch Light/Dark',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (isLogin) Icon(Icons.person),
                  SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (isLogin) {
                        context.read<LoginPageState>().logout();
                      } else {
                        context.read<LoginPageState>().login();
                      }
                    },
                    child: Text(isLogin ? 'Logout' : 'Login'),
                  ),
                ],
              ),
            ),
            Spacer(),
            Icon(
              isLightMode ? Icons.light_mode : Icons.dark_mode,
              size: 100.0,
            ),
            SizedBox(
              height: 30,
            ),
            Switch(
              value: isLightMode,
              onChanged: (value) {
                context.read<HomePageState>().toggleMode();
              },
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
