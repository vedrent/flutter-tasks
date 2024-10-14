import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_5/presentation/screens/favorite/FavoriteScreen.dart';
import 'package:task_5/presentation/screens/MainScreen.dart';
import 'package:task_5/presentation/screens/cart/CartScreen.dart';
import 'package:task_5/presentation/screens/profile/ProfileScreen.dart';

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
    CartScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Главная',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: 'Избранное',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Корзина',
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