class ChatModel {
  String? id;
  String? message;
  String? senderName;
  String? senderId;
  String? receiverId;
  String? timestamp;
  String? readStatus;
  String? imageUrl;
  String? audioUrl;
  String? videoUrl;
  String? documentUrl;
  String? reactions;
  String? replies;

  ChatModel({
    this.id,
    this.message,
    this.senderName,
    this.senderId,
    this.receiverId,
    this.timestamp,
    this.readStatus,
    this.imageUrl,
    this.audioUrl,
    this.videoUrl,
    this.documentUrl,
    this.reactions,
    this.replies,
  });

  ChatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    senderName = json['senderName'];
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    timestamp = json['timestamp'];
    readStatus = json['readStatus'];
    imageUrl = json['imageUrl'];
    audioUrl = json['audioUrl'];
    videoUrl = json['videoUrl'];
    documentUrl = json['documentUrl'];
    reactions = json['reactions'];
    replies = json['replies'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    data['senderName'] = this.senderName;
    data['senderId'] = this.senderId;
    data['receiverId'] = this.receiverId;
    data['timestamp'] = this.timestamp;
    data['readStatus'] = this.readStatus;
    data['imageUrl'] = this.imageUrl;
    data['audioUrl'] = this.audioUrl;
    data['videoUrl'] = this.videoUrl;
    data['documentUrl'] = this.documentUrl;
    data['reactions'] = this.reactions;
    data['replies'] = this.replies;
    return data;
  }
}
