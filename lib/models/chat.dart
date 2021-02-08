// To parse this JSON data, do
//
//     final chat = chatFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

Chat chatFromJson(String str) => Chat.fromJson(json.decode(str));

String chatToJson(Chat data) => json.encode(data.toJson());

class Chat {
  Chat({
    this.body,
    this.sentBy,
    this.time,
  });

  String body;
  String sentBy;
  Timestamp time;

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        body: json["body"],
        sentBy: json["sent by"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "body": body,
        "sentBy": sentBy,
        "time": time,
      };
}
