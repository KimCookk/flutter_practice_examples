import 'package:flutter/material.dart';

class NavigatorBottomBarExample extends StatefulWidget {
  const NavigatorBottomBarExample({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NavigatorBottomBarExampleState();
  }
}

class _NavigatorBottomBarExampleState extends State<NavigatorBottomBarExample> {
  // selectedIndex
  int _selectedIndex = 0;
  // 선택 된 widget
  final List<Widget> _tapWidgets = [
    Text(
      'Home',
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    ),
    Text(
      'Feed',
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    ),
    Text(
      'Settings',
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    ),
  ];
  // bottom bar option
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: IndexedStack(
          // IndexedStack을 사용 할 경우 scrollView scroll 위치, TextField input 값들을 기억 할 수 있다.
          index: _selectedIndex,
          children: _tapWidgets,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: "feed",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "setting",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
