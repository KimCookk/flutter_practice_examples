import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/11_provider/bottom_nav_state.dart';
import 'package:provider/provider.dart';

class ProviderNavBottomExample extends StatelessWidget {
  final List<Widget> _pages = const [
    Center(child: Text("Home")),
    Center(child: Text("Feed")),
    Center(child: Text("Settings")),
  ];

  const ProviderNavBottomExample({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.watch<BottomNavState>().index;
    // TODO: implement build
    return Scaffold(
      body: _pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (value) {
          context.read<BottomNavState>().setIndex(value);
        },
      ),
    );
  }
}
