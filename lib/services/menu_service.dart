import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/menu_item.dart';

class MenuService {
  static const String baseUrl = 'http://localhost:8080/api/menus';

  Future<List<MenuItem>> fetchMenuItems() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => MenuItem.fromJson(item)).toList();
    } else {
      throw Exception('메뉴 데이터를 불러오는 데 실패했습니다');
    }
  }
}
