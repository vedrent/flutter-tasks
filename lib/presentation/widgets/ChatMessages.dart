import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:task_5/data/UserService.dart';
import 'package:task_5/data/ChatService.dart';
import 'package:task_5/presentation/models/ChatMessageModel.dart';


class ChatMessages extends StatelessWidget {
  final String? chattedUserId;
  String? userId;

  ChatMessages({
    super.key,
    required this.chattedUserId
  })

  {
    userId = getUserId();
    if (isAdmin()) {
      userId = chattedUserId;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chats')
          .doc(userId)
          .collection('messages')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (ctx, AsyncSnapshot<QuerySnapshot> chatSnapshot) {
        if (chatSnapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (chatSnapshot.data == null) {
          return const CircularProgressIndicator();
        }
        final docs = chatSnapshot.data!.docs;
        return ListView.builder(
            reverse: true,
            itemCount: docs.length,
            itemBuilder: (context, index) => ChatMessage(
                message: ChatMessageModel.fromSnapshot(docs[index])
            )
        );
      },
    );
  }
}

class ChatMessage extends StatelessWidget {
  final ChatMessageModel message;
  Alignment? alignment;
  CrossAxisAlignment axisAlignment = CrossAxisAlignment.start;

  ChatMessage({
    super.key,
    required this.message
  }) {
    if (message.receiver == getUserId()) {
      alignment = Alignment.topLeft;
      axisAlignment = CrossAxisAlignment.start;
    }
    else {
      alignment = Alignment.topRight;
      axisAlignment = CrossAxisAlignment.end;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 300,
          child: Column(
            crossAxisAlignment: axisAlignment,
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.lightGreenAccent.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  message.text,
                  style: const TextStyle(
                      fontSize: 22
                  ),
                ),
              ),
              Text(
                  "${message.sentDate?.hour.toString().padLeft(2, '0')} : ${message.sentDate?.minute.toString().padLeft(2, '0')}",
                  textAlign: TextAlign.end
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewChatMessage extends StatelessWidget {
  final ChatService chatService;
  final String? chattedUserId;

  NewChatMessage({
    super.key,
    required this.chatService,
    this.chattedUserId
  });

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              child: TextField(
                controller: controller,
                onChanged: (value) {
                },
              )
          ),
          IconButton(
              onPressed: () {
                String receiverId = chattedUserId ?? getAdminId();
                ChatMessageModel message = ChatMessageModel(
                    text: controller.text,
                    receiver: receiverId
                );

                chatService.sendMessage(message);
                controller.text = "";
              },
              icon: const Icon(Icons.send)
          )
        ],
      ),
    );
  }
}