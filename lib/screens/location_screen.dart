import 'package:flutter/material.dart';
import '../services/location_service.dart';
import '../models/store.dart';
import '../widgets/store_tile.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final LocationService _locationService = LocationService();
  late Future<List<Store>> _stores;

  @override
  void initState() {
    super.initState();
    _stores = _locationService.fetchStores();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('가게 위치')),
      body: FutureBuilder<List<Store>>(
        future: _stores,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('오류: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('가게 정보가 없습니다.'));
          }

          final stores = snapshot.data!;
          return ListView.builder(
            itemCount: stores.length,
            itemBuilder: (context, index) => StoreTile(store: stores[index]),
          );
        },
      ),
    );
  }
}
