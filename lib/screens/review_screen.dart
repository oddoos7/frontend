import 'package:flutter/material.dart';
import '../models/review.dart';
import '../services/review_service.dart';
import '../widgets/review_tile.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  late Future<List<Review>> _reviews;

  @override
  void initState() {
    super.initState();
    _reviews = ReviewService().fetchReviews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('리뷰 목록')),
      body: FutureBuilder<List<Review>>(
        future: _reviews,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('에러 발생: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('리뷰가 없습니다.'));
          } else {
            final reviews = snapshot.data!;
            return ListView.builder(
              itemCount: reviews.length,
              itemBuilder: (context, index) =>
                  ReviewTile(review: reviews[index]),
            );
          }
        },
      ),
    );
  }
}
