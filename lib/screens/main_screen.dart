import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/bottom_nav_provider.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import 'home_screen.dart';
import 'menu_screen.dart';
import 'location_screen.dart';
import 'review_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  final List<Widget> _screens = const [
    HomeScreen(),
    MenuScreen(),
    LocationScreen(),
    ReviewScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);
    final currentIndex = bottomNavProvider.currentIndex;

    return Scaffold(
      appBar: _buildAppBar(currentIndex),
      body: _screens[currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => bottomNavProvider.updateIndex(index),
      ),
    );
  }

  PreferredSizeWidget? _buildAppBar(int index) {
    switch (index) {
      case 0:
        return AppBar(title: const Text('홈'));
      case 1:
        return AppBar(title: const Text('메뉴'));
      case 2:
        return AppBar(title: const Text('위치'));
      case 3:
        return AppBar(title: const Text('리뷰'));
      default:
        return null;
    }
  }
}
