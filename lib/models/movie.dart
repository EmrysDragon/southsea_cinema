class Movie {
  final String id;
  final String title;
  final String description;
  final String runTime;
  final String imagePath;
  final String ageRating;
  final String screeningTime;
  final double price;

  const Movie({
    required this.id,
    required this.title,
    required this.description,
    required this.runTime,
    required this.imagePath,
    required this.ageRating,
    required this.price,
    required this.screeningTime,
  });

  String get formattedPrice => '£${price.toStringAsFixed(2)}';
}
