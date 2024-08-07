class Jewe {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;

  Jewe({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
  });

  factory Jewe.fromJson(Map<String, dynamic> json) {
    return Jewe(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      image: json['image'],
    );
  }
}
