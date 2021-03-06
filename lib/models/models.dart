// To parse this JSON data, do
//
//     final chat = chatFromJson(jsonString);

import 'dart:convert';

Chat chatFromJson(String str) => Chat.fromJson(json.decode(str));

String chatToJson(Chat data) => json.encode(data.toJson());

class Chat {
    Chat({
        this.avatar,
        this.name,
        this.isGroup,
        this.updatedAt,
        this.message,
    });

    String? avatar;
    String? name;
    bool? isGroup;
    String? updatedAt;
    String? message;

    factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        avatar: json["avatar"],
        name: json["name"],
        isGroup: json["isGroup"],
        updatedAt: json["updated at"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "name": name,
        "isGroup": isGroup,
        "updated at": updatedAt,
        "message": message,
    };
}
