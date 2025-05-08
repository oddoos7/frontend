import 'package:flutter/material.dart';
import '../models/menu_item.dart';

class MenuItemTile extends StatelessWidget {
  final MenuItem menuItem;

  const MenuItemTile({super.key, required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(menuItem.name),
      subtitle: Text('${menuItem.description}\n₩${menuItem.price}'),
    );
  }
}
