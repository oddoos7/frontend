import 'package:flutter/material.dart';
import '../models/store.dart';

class StoreTile extends StatelessWidget {
  final Store store;

  const StoreTile({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: const Icon(Icons.store, size: 40, color: Colors.green),
        title: Text(store.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(store.address),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${store.latitude.toStringAsFixed(4)}'),
            Text('${store.longitude.toStringAsFixed(4)}'),
          ],
        ),
      ),
    );
  }
}
