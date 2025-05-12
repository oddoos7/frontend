import 'package:flutter/material.dart';
import '../screens/menu_screen.dart';
import '../screens/location_screen.dart';
import '../screens/review_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<String> _titles = [
    '메뉴',
    '위치',
    '리뷰',
  ];

  static const List<Widget> _screens = [
    MenuScreen(),
    LocationScreen(),
    ReviewScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        elevation: 2,
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: '메뉴',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: '위치',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.reviews),
            label: '리뷰',
          ),
        ],
      ),
    );
  }
}
