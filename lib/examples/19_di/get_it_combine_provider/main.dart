import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/19_di/get_it_combine_provider/auth_service.dart';
import 'package:flutter_practice_examples/examples/19_di/get_it_combine_provider/login_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'login_page.dart';

final getIt = GetIt.instance;

void main(List<String> args) {
  setupLocator();
  runApp(ChangeNotifierProvider(
    create: (context) => LoginViewModel(getIt<AuthService>()),
    child: CombineProviderApp(),
  ));
}

void setupLocator() {
  getIt.registerLazySingleton<AuthService>(() => AuthService());
}

class CombineProviderApp extends StatelessWidget {
  const CombineProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    bool isLogin = context.watch<LoginViewModel>().isLogin;

    return MaterialApp(
      home: isLogin ? HomePage() : LoginPage(),
    );
  }
}
