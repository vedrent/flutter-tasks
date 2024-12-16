import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessageModel {
  final String text;
  final DateTime? sentDate;
  final String? receiver;

  ChatMessageModel({
    required this.text,
    this.receiver,
    this.sentDate
  });

  static ChatMessageModel fromSnapshot(QueryDocumentSnapshot<Object?> snapshot) {
    return ChatMessageModel(
        text: snapshot['text'],
        receiver: snapshot['receiver'],
        sentDate: snapshot['createdAt'].toDate()
    );
  }
}