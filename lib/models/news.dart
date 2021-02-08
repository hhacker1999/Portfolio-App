// To parse this JSON data, do
//
//     final stories = storiesFromJson(jsonString);

import 'dart:convert';

List<Stories> storiesFromJson(String str) =>
    List<Stories>.from(json.decode(str).map((x) => Stories.fromJson(x)));

String storiesToJson(List<Stories> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Stories {
  Stories({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory Stories.fromJson(Map<String, dynamic> json) => Stories(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
