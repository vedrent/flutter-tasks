import 'package:flutter/material.dart';
import 'package:task_5/presentation/models/PersonModel.dart';

import '../../widgets/NumericFieldWidget.dart';
import '../../widgets/TextFieldWidget.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({
    super.key,
    required this.oldProfile,
    required this.onProfileCreated
  });

  final ValueChanged<PersonModel> onProfileCreated;
  PersonModel oldProfile;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState(
      onProfileCreated, oldProfile
  );
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  PersonModel profile;

  final ValueChanged<PersonModel> onProfileCreated;
  _EditProfileScreenState(
      this.onProfileCreated,
      this.profile
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Редактирование профиля"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFieldWidget(
              onChanged: (text) { profile.name = text; },
              hintText: "Фио",
              initialValue: profile.name,
            ),
            TextFieldWidget(
              onChanged: (text) { profile.group = text; },
              hintText: "Группа",
              initialValue: profile.group,
            ),
            NumericFieldWidget(
              onChanged: (text) {
                try {
                  profile.taskNumber = int.parse(text);
                }
                catch(e) {
                  profile.taskNumber = 0;
                }
              },
              hintText: "Номер работы",
              initialValue: profile.taskNumber,
            ),
            TextFieldWidget(
                onChanged: (text) { profile.phoneNumber = text; },
                initialValue: profile.phoneNumber,
                hintText: "Номер телефона"
            ),
            TextFieldWidget(
                onChanged: (text) { profile.email = text; },
                initialValue: profile.email,
                hintText: "Электронная почта"
            ),

            const Spacer(),
            OutlinedButton(
                onPressed: () {
                  onProfileCreated(profile);

                  Navigator.pop(context, profile);
                },
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(300,50),
                    backgroundColor: const Color.fromRGBO(182, 247, 143, 1),
                    side: const BorderSide(color: const Color.fromRGBO(182, 247, 143, 1))
                ),
                child: const Text("Подтвердить")
            ),
          ],
        ),
      ),
    );
  }
}