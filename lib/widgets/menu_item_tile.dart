import 'package:flutter/material.dart';
import '../models/menu_item.dart';

class MenuItemTile extends StatelessWidget {
  final MenuItem menu;

  const MenuItemTile({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: menu.imageUrl.isNotEmpty
            ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  menu.imageUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              )
            : const Icon(Icons.image_not_supported, size: 60),
        title: Text(
          menu.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(menu.description),
        trailing: Text('${menu.price}원'),
      ),
    );
  }
}
