import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/review.dart';

class ReviewService {
  static const String baseUrl = 'http://localhost:8080/api/reviews';

  Future<List<Review>> fetchReviews() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Review.fromJson(json)).toList();
    } else {
      throw Exception('리뷰 데이터를 불러오는 데 실패했습니다.');
    }
  }
}
