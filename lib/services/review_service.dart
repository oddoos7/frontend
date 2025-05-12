import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/review.dart';

class ReviewService {
  Future<List<Review>> fetchReviews() async {
    final url = Uri.parse('http://localhost:8080/api/reviews');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((json) => Review.fromJson(json)).toList();
    } else {
      throw Exception('리뷰 데이터를 불러오는 데 실패했습니다.');
    }
  }
}
