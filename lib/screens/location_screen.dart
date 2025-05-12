import 'package:flutter/material.dart';
import '../models/store.dart';
import '../services/location_service.dart';
import '../widgets/store_tile.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late Future<List<Store>> _stores;

  @override
  void initState() {
    super.initState();
    _stores = LocationService().fetchNearbyStores();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('내 주변 가게')),
      body: FutureBuilder<List<Store>>(
        future: _stores,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('에러 발생: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('근처 가게가 없습니다.'));
          } else {
            final stores = snapshot.data!;
            return ListView.builder(
              itemCount: stores.length,
              itemBuilder: (context, index) => StoreTile(store: stores[index]),
            );
          }
        },
      ),
    );
  }
}
