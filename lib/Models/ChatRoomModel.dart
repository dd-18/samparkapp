import 'package:samparkapp/Models/UserModel.dart';

import 'ChatModel.dart';

class ChatRoomModel {
  String? id;
  UserModel? sender;
  UserModel? receiver;
  List<ChatModel>? messages;
  int? unReadMessNo;
  String? lastMessage;
  String? lastMessageTimestamp;
  String? timestamp;

  ChatRoomModel({
    this.id,
    this.sender,
    this.receiver,
    this.messages,
    this.unReadMessNo,
    this.lastMessage,
    this.lastMessageTimestamp,
    this.timestamp,
  });

  ChatRoomModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sender = json['sender'] != null
        ? new UserModel.fromJson(json['sender'])
        : null;
    receiver = json['receiver'] != null
        ? new UserModel.fromJson(json['receiver'])
        : null;
    if (json['messages'] is List) {
      messages = json['messages'] ?? [];
    } else {
      messages = [];
    }
    unReadMessNo = json['unReadMessNo'];
    lastMessage = json['lastMessage'];
    lastMessageTimestamp = json['lastMessageTimestamp'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.sender != null) {
      data['sender'] = this.sender!.toJson();
    }
    if (this.receiver != null) {
      data['receiver'] = this.receiver!.toJson();
    }
    if (this.messages != null) {
      data['messages'] = this.messages!.map((v) => v.toJson()).toList();
    }
    data['unReadMessNo'] = this.unReadMessNo;
    data['lastMessage'] = this.lastMessage;
    data['lastMessageTimestamp'] = this.lastMessageTimestamp;
    data['timestamp'] = this.timestamp;
    return data;
  }
}
