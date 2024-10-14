import 'package:flutter/material.dart';
import 'package:task_5/presentation/screens/profile/EditProfileScreen.dart';

import 'package:task_5/data/PersonData.dart';
import 'package:task_5/presentation/models/PersonModel.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var profile = profileModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Профиль"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              initialValue: profile.name,
              maxLines: null,
              readOnly: true,
            ),
            TextFormField(
              initialValue: profile.group,
              maxLines: null,
              readOnly: true,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              initialValue: "Flutter task_${profile.taskNumber.toString()}",
              readOnly: true,
            ),
            TextFormField(
              initialValue: profile.phoneNumber,
              maxLines: null,
              readOnly: true,
            ),
            TextFormField(
              initialValue: profile.email,
              maxLines: null,
              readOnly: true,
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