import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/store.dart';

class LocationService {
  Future<List<Store>> fetchNearbyStores() async {
    final url = Uri.parse('http://localhost:8080/api/locations');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((json) => Store.fromJson(json)).toList();
    } else {
      throw Exception('가게 정보를 불러오는데 실패했습니다.');
    }
  }
}