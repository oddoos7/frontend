import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import 'menu_screen.dart';
import 'location_screen.dart';
import 'review_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Center(child: Text("홈 화면")), // 향후 배너, 프로모션 추가 가능
    const MenuScreen(),
    const LocationScreen(),
    const ReviewScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: '메뉴',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            label: '가게찾기',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rate_review),
            label: '리뷰',
          ),
        ],
      ),
    );
  }
}
