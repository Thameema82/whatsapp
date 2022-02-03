import 'dart:convert';

ChatMessage chatMessageFromJson(String str) => ChatMessage.fromJson(json.decode(str));

String chatMessageToJson(ChatMessage data) => json.encode(data.toJson());

class ChatMessage {
    ChatMessage({
        this.isSend,
        this.isReaded,
        this.sendAt,
        this.message,
    });

    bool? isSend;
    bool? isReaded;
    String? sendAt;
    String? message;

    factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
        isSend: json["isSend"],
        isReaded: json["isReaded"],
        sendAt: json["send At"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "isSend": isSend,
        "isReaded": isReaded,
        "send At": sendAt,
        "message": message,
    };
}
