import 'package:flutter/material.dart';
import 'package:task_5/data/ChatService.dart';
import 'package:task_5/presentation/widgets/ChatMessages.dart';
import 'package:task_5/presentation/models/ChatMessageModel.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatMessageModel> messages = [];
  final ChatService service = ChatService();

  @override
  void initState() {
    service.sendMessage(ChatMessageModel(text: "Test"));
    getMessages().then((value) => setState(() {
      messages = value;
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Чат'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ChatMessages(),
            ),
          ],
        ),
      ),
    );
  }
}