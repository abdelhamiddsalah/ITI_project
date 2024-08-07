/*import 'dart:convert';

class Fruits {
    String? name;
    int? id;
    String? family;
    String? order;
    String? genus;
    Nutritions? nutritions;

    Fruits({
        this.name,
        this.id,
        this.family,
        this.order,
        this.genus,
        this.nutritions,
    });

    factory Fruits.fromRawJson(String str) => Fruits.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Fruits.fromJson(Map<String, dynamic> json) => Fruits(
        name: json["name"],
        id: json["id"],
        family: json["family"],
        order: json["order"],
        genus: json["genus"],
        nutritions: json["nutritions"] == null ? null : Nutritions.fromJson(json["nutritions"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "family": family,
        "order": order,
        "genus": genus,
        "nutritions": nutritions?.toJson(),
    };
}

class Nutritions {
    int? calories;
    double? fat;
    double? sugar;
    double? carbohydrates;
    double? protein;

    Nutritions({
        this.calories,
        this.fat,
        this.sugar,
        this.carbohydrates,
        this.protein,
    });

    factory Nutritions.fromRawJson(String str) => Nutritions.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Nutritions.fromJson(Map<String, dynamic> json) => Nutritions(
        calories: json["calories"],
        fat: json["fat"]?.toDouble(),
        sugar: json["sugar"]?.toDouble(),
        carbohydrates: json["carbohydrates"]?.toDouble(),
        protein: json["protein"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "calories": calories,
        "fat": fat,
        "sugar": sugar,
        "carbohydrates": carbohydrates,
        "protein": protein,
    };
}
*/