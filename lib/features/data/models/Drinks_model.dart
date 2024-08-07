/*import 'dart:convert';

class Drinnks {
    List<Map<String, String?>>? drinks;

    Drinnks({
        this.drinks,
    });

    factory Drinnks.fromRawJson(String str) => Drinnks.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Drinnks.fromJson(Map<String, dynamic> json) => Drinnks(
        drinks: json["drinks"] == null ? [] : List<Map<String, String?>>.from(json["drinks"]!.map((x) => Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))),
    );

    Map<String, dynamic> toJson() => {
        "drinks": drinks == null ? [] : List<dynamic>.from(drinks!.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    };
}
*/