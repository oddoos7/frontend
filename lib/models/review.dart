class Review {
  final String id;
  final String storeName;
  final String reviewerName;
  final String content;
  final int rating;

  Review({
    required this.id,
    required this.storeName,
    required this.reviewerName,
    required this.content,
    required this.rating,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      storeName: json['storeName'],
      reviewerName: json['reviewerName'],
      content: json['content'],
      rating: json['rating'],
    );
  }
}
