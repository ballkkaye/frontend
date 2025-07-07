class BoardImage {
  final int id;
  final String imageUrl;

  BoardImage({
    required this.id,
    required this.imageUrl,
  });

  factory BoardImage.fromMap(Map<String, dynamic> data) {
    return BoardImage(
      id: data['id'],
      imageUrl: data['imageUrl'],
    );
  }
}
