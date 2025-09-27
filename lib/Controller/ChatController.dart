import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:samparkapp/Controller/ProfileController.dart';
import 'package:samparkapp/Models/UserModel.dart';
import 'package:uuid/uuid.dart';
import '../Models/ChatModel.dart';
import '../Models/ChatRoomModel.dart';

class ChatController extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  var uuid = Uuid();
  RxString selectedImagePath = ''.obs;
  ProfileController controller = Get.put(ProfileController());

  String getRoomId(String targetUserId) {
    String currentUserId = auth.currentUser!.uid;
    if (currentUserId[0].codeUnitAt(0) > targetUserId[0].codeUnitAt(0)) {
      return currentUserId + targetUserId;
    } else {
      return targetUserId + currentUserId;
    }
  }

  UserModel getSender(UserModel currentUser, UserModel targetUser) {
    String currentUserId = currentUser.id!;
    String targetUserId = targetUser.id!;
    if (currentUserId[0].codeUnitAt(0) > targetUserId[0].codeUnitAt(0)) {
      return currentUser;
    } else {
      return targetUser;
    }
  }

  UserModel getReciver(UserModel currentUser, UserModel targetUser) {
    String currentUserId = currentUser.id!;
    String targetUserId = targetUser.id!;
    if (currentUserId[0].codeUnitAt(0) > targetUserId[0].codeUnitAt(0)) {
      return targetUser;
    } else {
      return currentUser;
    }
  }

  Future<void> sendMessage(
    String targetUserId,
    String message,
    UserModel targetUser,
  ) async {
    isLoading.value = true;
    String chatId = uuid.v6();

    String roomId = getRoomId(targetUserId);
    DateTime timestamp = DateTime.now();
    String nowTime = DateFormat('hh:mm a').format(timestamp);

    UserModel sender = getSender(controller.currentUser.value, targetUser);
    UserModel receiver = getReciver(controller.currentUser.value, targetUser);

    var newChat = ChatModel(
      id: chatId,
      senderName: controller.currentUser.value.name,
      message: message,
      senderId: auth.currentUser!.uid,
      receiverId: targetUserId,
      timestamp: DateTime.now().toString(),
      readStatus: 'unread',
    );

    var roomDetails = ChatRoomModel(
      id: roomId,
      lastMessage: message,
      lastMessageTimestamp: nowTime,
      timestamp: DateTime.now().toString(),
      sender: sender,
      receiver: receiver,
      unReadMessNo: 0,
    );

    try {
      await db
          .collection("chats")
          .doc(roomId)
          .collection("messages")
          .doc(chatId)
          .set(newChat.toJson());
      await db.collection("chats").doc(roomId).set(roomDetails.toJson());
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  Stream<List<ChatModel>> getMessages(String targetUserId) {
    String roomId = getRoomId(targetUserId);
    return db
        .collection("chats")
        .doc(roomId)
        .collection("messages")
        .orderBy("timestamp", descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map((doc) {
            return ChatModel.fromJson(doc.data());
          }).toList(),
        );
  }

  Future<void> sendImage(
    String targetUserId,
    String imagePath,
    UserModel targetUser,
    String messageText,
  ) async {
    isLoading.value = true;
    String chatId = uuid.v6();
    String roomId = getRoomId(targetUserId);
    DateTime timestamp = DateTime.now();
    String nowTime = DateFormat('hh:mm a').format(timestamp);

    UserModel sender = getSender(controller.currentUser.value, targetUser);
    UserModel receiver = getReciver(controller.currentUser.value, targetUser);

    String imageUrl = imagePath;

    /*
    try {
      String fileName = uuid.v4(); // Unique file name for the image
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref('chat_images/$roomId/$fileName');
      File imageFile = File(imagePath);
      await ref.putFile(imageFile);
      imageUrl = await ref.getDownloadURL();
    } catch (e) {
      print("Error uploading image: $e");
      isLoading.value = false;
      Get.snackbar("Error", "Failed to upload image. Please try again.");
      return;
    }
    */

    var newChat = ChatModel(
      id: chatId,
      senderName: controller.currentUser.value.name,
      message: messageText,
      imageUrl: imageUrl,
      senderId: auth.currentUser!.uid,
      receiverId: targetUserId,
      timestamp: DateTime.now().toString(),
      readStatus: 'unread',
    );

    var roomDetails = ChatRoomModel(
      id: roomId,
      lastMessage: messageText.isNotEmpty ? messageText : "📷 Image",
      lastMessageTimestamp: nowTime,
      timestamp: DateTime.now().toString(),
      sender: sender,
      receiver: receiver,
      unReadMessNo: 0,
    );

    try {
      await db
          .collection("chats")
          .doc(roomId)
          .collection("messages")
          .doc(chatId)
          .set(newChat.toJson());
      await db.collection("chats").doc(roomId).set(roomDetails.toJson());
    } catch (e) {
      print("Error sending image message: $e");
      Get.snackbar("Error", "Failed to send image message.");
    }
    isLoading.value = false;
  }
}
