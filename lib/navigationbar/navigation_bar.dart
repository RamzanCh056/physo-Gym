import 'package:flutter/material.dart';
import 'package:my_physio/home/home_screen.dart';

import '../home/recomended_screen.dart';
import '../home/settings_screen.dart';


class CustomNavBar extends StatefulWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _currentIndex = 0;
  List<Widget> pages = [
    const HomeScreen(),
    const RecomendedScreen(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          currentIndex: _currentIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.play_circle_fill), label: 'recommended'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
      ),
    );
  }
}
