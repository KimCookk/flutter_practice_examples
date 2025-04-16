import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/14_go_router/log/first_page.dart';
import 'package:flutter_practice_examples/examples/14_go_router/log/route_observer.dart';
import 'package:flutter_practice_examples/examples/14_go_router/log/seconds_page.dart';
import 'package:flutter_practice_examples/examples/14_go_router/log/third_page.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(GoRouterLogApp());
}

class GoRouterLogApp extends StatelessWidget {
  const GoRouterLogApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: '/first',
        routes: [
          GoRoute(
            path: '/first',
            builder: (context, state) => const FirstPage(),
          ),
          GoRoute(
            path: '/seconds',
            builder: (context, state) => const SecondsPage(),
          ),
          GoRoute(
            path: '/third',
            builder: (context, state) => const ThirdPage(),
          ),
        ],
        observers: [RouterObserver()],
      ),
    );
  }
}
