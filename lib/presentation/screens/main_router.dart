import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_5/presentation/screens/cart/shopping_cart_screen.dart';
import 'package:task_5/presentation/screens/home/main_screen.dart';
import 'package:task_5/presentation/screens/profile/profile_screen.dart';

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
    ShoppingCartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: SafeArea(
          child: _widgetOptions.elementAt(_selectedIndex),
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 12,
          unselectedFontSize: 12,
          unselectedLabelStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant
          ),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  _selectedIndex == 0 ? 'lib/assets/icons/home_active.svg' : 'lib/assets/icons/home.svg',
                  height: 32, width: 76,
                  fit: BoxFit.scaleDown
              ),
              label: 'Главная',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  _selectedIndex == 1 ? 'lib/assets/icons/cart_active.svg' : 'lib/assets/icons/cart.svg',
                  height: 32, width: 76,
                  fit: BoxFit.scaleDown
              ),
              label: 'Корзина',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  _selectedIndex == 2 ? 'lib/assets/icons/user_active.svg' : 'lib/assets/icons/user.svg',
                  height: 32, width: 76,
                  fit: BoxFit.scaleDown
              ),
              label: 'Профиль',
            ),
          ],
          onTap: _onItemTapped,
          currentIndex: _selectedIndex
      ),
    );
  }
}
