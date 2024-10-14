import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_5/presentation/screens/FavoriteScreen.dart';
import 'package:task_5/presentation/screens/MainScreen.dart';
import 'package:task_5/presentation/screens/ProfileScreen.dart';

class MainRouter extends StatefulWidget {
  const MainRouter({super.key});

  @override
  State<MainRouter> createState() => _MainRouterState();
}

class _MainRouterState extends State<MainRouter> {

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    MainScreen(),
    FavoriteScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Главная',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: 'Избранное',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity_rounded),
              label: 'Профиль',
            )
          ],
          onTap: _onItemTapped,
          currentIndex: _selectedIndex
      ),
    );
  }
}