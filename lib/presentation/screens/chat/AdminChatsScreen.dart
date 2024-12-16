import 'package:flutter/material.dart';
class AdminChatsScreen extends StatefulWidget {
  const AdminChatsScreen({super.key});

  @override
  State<AdminChatsScreen> createState() => _AdminChatsScreenState();
}
class _AdminChatsScreenState extends State<AdminChatsScreen> {
  List<String> chats = [
    "Chat 1",
    "Chat 2",
    "Chat 3",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Чаты"),
        ),
        body: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (BuildContext context, int index) => Column(
              children: [
                ChatItemWidget(userId: chats[index]),
                const Divider()
              ],
            )
        )
    );
  }
}

class ChatItemWidget extends StatelessWidget {
  const ChatItemWidget({
    super.key,
    required this.userId
  });

  final String userId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(userId),
    );
  }
}