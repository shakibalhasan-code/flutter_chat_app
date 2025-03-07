import 'dart:convert';

class Message {
  final String id;
  final String senderId;
  final String receiverId;
  final String senderModel;
  final String receiverModel;
  final String file;
  final List<String> seenBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Message({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.senderModel,
    required this.receiverModel,
    required this.file,
    required this.seenBy,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  // Factory constructor to create a Message instance from JSON
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json["_id"],
      senderId: json["senderId"],
      receiverId: json["receiverId"],
      senderModel: json["senderModel"],
      receiverModel: json["receiverModel"],
      file: json["file"],
      seenBy: List<String>.from(json["seenBy"]),
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      v: json["__v"],
    );
  }

  // Method to convert a Message instance to JSON
  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "senderId": senderId,
      "receiverId": receiverId,
      "senderModel": senderModel,
      "receiverModel": receiverModel,
      "file": file,
      "seenBy": seenBy,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
      "__v": v,
    };
  }
}
