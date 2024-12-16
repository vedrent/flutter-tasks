import 'package:flutter/material.dart';
import 'package:task_5/data/ChatService.dart';
import 'package:task_5/presentation/widgets/ChatMessages.dart';
import 'package:task_5/presentation/models/ChatMessageModel.dart';

class ChatScreen extends StatefulWidget {
  final String chattedUserId;
  const ChatScreen({
    super.key,
    required this.chattedUserId
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatMessageModel> messages = [];
  final ChatService service = ChatService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<String>(
          future: getUsername(widget.chattedUserId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text('Загрузка...');
            } else if (snapshot.hasError) {
              return const Text('Ошибка');
            } else {
              return Text(snapshot.data ?? '');
            }
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ChatMessages(
                chattedUserId: widget.chattedUserId,
              ),
            ),
            NewChatMessage(
              chatService: service,
              chattedUserId: widget.chattedUserId,
            ),
          ],
        ),
      ),
    );
  }
}