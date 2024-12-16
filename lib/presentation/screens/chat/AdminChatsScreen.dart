import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task_5/data/ChatService.dart';
import 'package:task_5/presentation/screens/chat/ChatScreen.dart';


class AdminChatsScreen extends StatefulWidget {
  const AdminChatsScreen({super.key});

  @override
  State<AdminChatsScreen> createState() => _AdminChatsScreenState();
}
class _AdminChatsScreenState extends State<AdminChatsScreen> {
  ChatService chatService = ChatService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Чаты"),
        ),
        body: StreamBuilder(
          stream: chatService.getAllChats(),
          builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.data == null) {
              return const CircularProgressIndicator();
            }
            final docs = snapshot.data!.docs;
            return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (BuildContext context, int index) => Column(
                  children: [
                    ChatItemWidget(userId: docs[index].id),
                    const Divider()
                  ],
                )
            );
          },
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
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return ChatScreen(
              chattedUserId: userId,
            );
          }));
        },
        child: SizedBox(
          width: double.infinity,
            child: Align(
              alignment: Alignment.center,
                child: FutureBuilder<String>(
                  future: getUsername(userId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return const Text('Ошибка загрузки имени');
                    } else {
                      return Text(snapshot.data ?? '',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18));
                    }
                  },
                ),
            )
        ),
      )
    );
  }
}

