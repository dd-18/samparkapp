import 'package:samparkapp/Models/UserModel.dart';

class GroupModel {
  String? id;
  String? name;
  String? description;
  String? profileUrl;
  List<UserModel>? members;
  String? createdAt;
  String? createdBy;
  String? status;
  String? lastMessage;
  String? lastMessageTime;
  String? lastMessageBy;
  int? unReadCount;
  String? timeStamp;

  GroupModel({
    this.id,
    this.name,
    this.description,
    this.profileUrl,
    this.members,
    this.createdAt,
    this.createdBy,
    this.status,
    this.lastMessage,
    this.lastMessageTime,
    this.lastMessageBy,
    this.unReadCount,
    this.timeStamp,
  });

  GroupModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    profileUrl = json['profileUrl'];
    if (json['members'] != null) {
      members = <UserModel>[];
      json['members'].forEach((v) {
        members!.add(new UserModel.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    createdBy = json['createdBy'];
    status = json['status'];
    lastMessage = json['lastMessage'];
    lastMessageTime = json['lastMessageTime'];
    lastMessageBy = json['lastMessageBy'];
    unReadCount = json['unReadCount'];
    timeStamp = json['timeStamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['profileUrl'] = this.profileUrl;
    if (this.members != null) {
      data['members'] = this.members!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['createdBy'] = this.createdBy;
    data['status'] = this.status;
    data['lastMessage'] = this.lastMessage;
    data['lastMessageTime'] = this.lastMessageTime;
    data['lastMessageBy'] = this.lastMessageBy;
    data['unReadCount'] = this.unReadCount;
    data['timeStamp'] = this.timeStamp;
    return data;
  }
}
