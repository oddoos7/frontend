import 'package:flutter/material.dart';
import '../models/review.dart';

class ReviewTile extends StatelessWidget {
  final Review review;

  const ReviewTile({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(review.content),
      subtitle: Text('평점: ${review.rating}점'),
    );
  }
}
