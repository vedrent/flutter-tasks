import 'package:flutter/material.dart';
import 'package:task_5/presentation/screens/profile/EditProfileScreen.dart';
import 'package:task_5/presentation/screens/orders/OrdersScreen.dart';
import 'package:task_5/presentation/screens/chat/ChatScreen.dart';
import 'package:task_5/presentation/screens/chat/AdminChatsScreen.dart';
import 'package:task_5/presentation/models/PersonModel.dart';
import 'package:task_5/data/PersonService.dart';
import 'package:task_5/data/UserService.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    getProfile().then((value) => setState(() {
      debugPrint(value.name);
      profile = value;
    }));
    super.initState();
  }
  PersonModel profile = profileModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text("Профиль"),
            Spacer(),
            IconButton(
              onPressed: () {
                if (isAdmin()) {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const AdminChatsScreen(),
                  ));
                }
                else {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const ChatScreen(),
                  ));
                }
              },
              icon: const Icon(Icons.chat_bubble_outline, size: 35,),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const OrdersScreen(),
                ));
              },
              icon: const Icon(Icons.history_outlined, size: 35,),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: Text(
                profile.name,
                style: const TextStyle(fontSize: 22),
              ),
              width: 500,
              alignment: Alignment.center,
            ),
            const SizedBox(height: 12.0),

            Text(
              profile.group,
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 12.0),
            Text(
              "Flutter task_${profile.taskNumber.toString()}",
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 12.0),
            Text(
              profile.phoneNumber,
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 12.0),
            Text(
              profile.email,
              style: const TextStyle(fontSize: 22),
            ),

            const Spacer(),
            OutlinedButton(
              onPressed: () async {
                final updatedProfile = await Navigator.push(context, MaterialPageRoute(
                            builder: (context) => EditProfileScreen(
                              oldProfile: profile,
                              onProfileCreated: (PersonModel value) {
                                setState(() {
                                  profile = value;
                                });
                              },
                            ),
                          ));
                if (updatedProfile != null) {
                  setState(() {
                    profile = updatedProfile;  // Обновляем профиль
                  });
                }
                  },
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(300,50),
                    backgroundColor: const Color.fromRGBO(182, 247, 143, 1),
                    side: const BorderSide(color: const Color.fromRGBO(182, 247, 143, 1))
                ),
                child: const Text("Редактировать")
            ),
          ],
        ),
      ),
    );
  }
}