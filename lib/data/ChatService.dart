import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task_5/data/UserService.dart';
import 'package:task_5/presentation/models/ChatMessageModel.dart';
import 'package:task_5/presentation/models/PersonModel.dart';
import 'dio_config.dart';

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

    var userId = getUserId();
    if (isAdmin()) {
      userId = receiver;
    }

    _firestore.collection("chats")
        .doc(userId)
        .collection("messages")
        .add({
      'text': message.text,
      'createdAt': Timestamp.now(),
      'userId': getUserId(),
      'receiver': receiver
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllChats() {
    final snapshot = _firestore.collection("chats").snapshots();
    return snapshot;
  }
}

Future<String> getUsername(var userId) async {
  var response = await getHttpClient().get(
      "/profile/$userId"
  );

  var username = jsonDecode(response.data);
  return username['username'];
}