import 'package:flutter/material.dart';
import '../models/store.dart';

class StoreTile extends StatelessWidget {
  final Store store;

  const StoreTile({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(store.name),
      subtitle: Text(store.address),
      trailing: Text('(${store.latitude}, ${store.longitude})'),
    );
  }
}
