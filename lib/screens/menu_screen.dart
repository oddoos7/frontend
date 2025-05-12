import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../services/menu_service.dart';
import '../widgets/menu_item_tile.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late Future<List<MenuItem>> _menus;

  @override
  void initState() {
    super.initState();
    _menus = MenuService().fetchMenus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('메뉴')),
      body: FutureBuilder<List<MenuItem>>(
        future: _menus,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('에러 발생: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('메뉴가 없습니다.'));
          } else {
            final menus = snapshot.data!;
            return ListView.builder(
              itemCount: menus.length,
              itemBuilder: (context, index) => MenuItemTile(menu: menus[index]),
            );
          }
        },
      ),
    );
  }
}
