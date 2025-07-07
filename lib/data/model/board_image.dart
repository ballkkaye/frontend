class BoardImage {
  final int id;
  final String imageUrl;

  BoardImage({
    required this.id,
    required this.imageUrl,
  });

  factory BoardImage.fromMap(Map<String, dynamic> json) {
    return BoardImage(
      id: json['id'],
      imageUrl: json['imageUrl'],
    );
  }
}
