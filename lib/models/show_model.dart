class Show {
  final int id;
  final String name;
  final String imageUrl;
  final double rating;
  final List<String> genres;
  final String summary;

  Show({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.genres,
    required this.summary,
  });

  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'No Title',
      imageUrl: json['image'] != null ? json['image']['medium'] ?? '' : '',
      rating: json['rating'] != null && json['rating']['average'] != null 
          ? (json['rating']['average'] as num).toDouble() 
          : 0.0,
      genres: json['genres'] != null ? List<String>.from(json['genres']) : [],
      summary: json['summary'] != null 
          ? json['summary'].replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), '') 
          : 'No Overview',
    );
  }
}