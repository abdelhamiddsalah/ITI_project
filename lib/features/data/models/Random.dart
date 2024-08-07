import 'dart:convert';

class Randomm {
    int? id;
    String? title;
    double? price;
    String? description;
    String? category;
    String? image;
    Rating? rating;

    Randomm({
        this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.image,
        this.rating,
    });

    factory Randomm.fromRawJson(String str) => Randomm.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Randomm.fromJson(Map<String, dynamic> json) => Randomm(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating?.toJson(),
    };
}

class Rating {
    double? rate;
    int? count;

    Rating({
        this.rate,
        this.count,
    });

    factory Rating.fromRawJson(String str) => Rating.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
    };
}
