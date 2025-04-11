import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageState extends ChangeNotifier {
  bool _isLightMode = true;

  get isLightMode => _isLightMode;

  HomePageState() {
    _loadModel();
  }

  void _loadModel() async {
    final prefs = await SharedPreferences.getInstance();
    _isLightMode = prefs.getBool("isLightMode") ?? true;
  }

  void toggleMode() async {
    _isLightMode = !_isLightMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isLightMode", _isLightMode);
    notifyListeners();
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLightMode = context.watch<HomePageState>().isLightMode;
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
          ],
        ),
      ),
    );
  }
}
