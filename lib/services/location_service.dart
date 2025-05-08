import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/store.dart';

class LocationService {
  static const String baseUrl = 'http://localhost:8080/api/locations';

  Future<List<Store>> fetchStores() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Store.fromJson(json)).toList();
    } else {
      throw Exception('가게 위치 데이터를 불러오는 데 실패했습니다.');
    }
  }
}
