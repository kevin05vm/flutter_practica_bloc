// To parse this JSON data, do
//
//     final types = typesFromMap(jsonString);

import 'dart:convert';

Types typesFromMap(String str) => Types.fromMap(json.decode(str));

String typesToMap(Types data) => json.encode(data.toMap());

class Types {
    Types({
        required this.success,
        required this.data
    });

    final bool success;
    final Data data;

    factory Types.fromMap(Map<String, dynamic> json) => Types(
        success: json["success"],
        data: Data.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "success": success,
        "data": data.toMap(),
    };
}

class Data {
    Data({
        required this.memes,
    });

    final List<Meme> memes;

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        memes: List<Meme>.from(json["memes"].map((x) => Meme.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "memes": List<dynamic>.from(memes.map((x) => x.toMap())),
    };
}

class Meme {
    Meme({
        required this.id,
        required this.name,
        required this.url,
        required this.width,
        required this.height,
        required this.boxCount
    });

    final String id;
    final String name;
    final String url;
    final int width;
    final int height;
    final int boxCount;

    factory Meme.fromMap(Map<String, dynamic> json) => Meme(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        width: json["width"],
        height: json["height"],
        boxCount: json["box_count"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "url": url,
        "width": width,
        "height": height,
        "box_count": boxCount,
    };
}