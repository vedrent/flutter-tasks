import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task_5/data/UserService.dart';
import 'package:task_5/presentation/models/ChatMessageModel.dart';

class ChatService extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(ChatMessageModel message) async {
    String receiver;
    if (message.receiver == null)
      receiver = getAdminId();
    else
      receiver = message.receiver!;
    if (getUserId() != getAdminId())
      receiver = getAdminId();
    _firestore.collection("chats")
        .doc(getUserId())
        .collection("messages")
        .add({
      'text': message.text,
      'createdAt': Timestamp.now(),
      'userId': getUserId(),
      'receiver': receiver
    });
  }
}

Future<List<ChatMessageModel>> getMessages() async {
  return [
    ChatMessageModel(text: "text")
  ];
}