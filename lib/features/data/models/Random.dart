
class Random {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  Random({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Random.fromJson(Map<String, dynamic> json) => Random(
    id: json["id"] as int,
    title: json["title"] as String,
    price: (json["price"] as num).toDouble(),
    description: json["description"] as String,
    category: json["category"] as String,
    image: json["image"] as String,
    rating: json["rating"] != null ? Rating.fromJson(json["rating"]) : Rating(rate: 0, count: 0), // Handle null rating
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": category,
    "image": image,
    "rating": rating.toJson(),
  };
}

class Rating {
  final double? rate;
  final int? count;

  Rating({
    this.rate,
    this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    rate: (json["rate"] as num?)?.toDouble(),
    count: json["count"] as int?,
  );

  Map<String, dynamic> toJson() => {
    "rate": rate,
    "count": count,
  };
}
