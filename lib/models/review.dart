class Review {
  final String id;
  final String reviewerName;
  final String content;
  final int rating;

  Review({
    required this.id,
    required this.reviewerName,
    required this.content,
    required this.rating,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'] ?? '',
      reviewerName: json['reviewerName'] ?? '',
      content: json['content'] ?? '',
      rating: json['rating'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reviewerName': reviewerName,
      'content': content,
      'rating': rating,
    };
  }
}
