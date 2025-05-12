import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/menu_item.dart';

class MenuService {
  final String baseUrl = 'http://localhost:8080/api/menus'; 

  Future<List<MenuItem>> fetchMenus() async {
    final response = await http.get(Uri.parse('$baseUrl/menus'));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => MenuItem.fromJson(json)).toList();
    } else {
      throw Exception('메뉴 불러오기에 실패했습니다.');
    }
  }
}
