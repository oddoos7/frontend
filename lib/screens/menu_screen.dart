import 'package:flutter/material.dart';
import '../services/menu_service.dart';
import '../models/menu_item.dart';
import '../widgets/menu_item_tile.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final MenuService _menuService = MenuService();
  late Future<List<MenuItem>> _menuItems;

  @override
  void initState() {
    super.initState();
    _menuItems = _menuService.fetchMenuItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('메뉴')),
      body: FutureBuilder<List<MenuItem>>(
        future: _menuItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('오류: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('메뉴가 없습니다.'));
          }

          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) => MenuItemTile(menuItem: items[index]),
          );
        },
      ),
    );
  }
}
