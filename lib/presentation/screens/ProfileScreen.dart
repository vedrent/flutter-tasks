import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Фамилия Имя Отчество",
            style: TextStyle(
                fontSize: 20
            ),
          ),
          Text(
            "Временная заглушка для профиля",
            style: TextStyle(
                fontSize: 20
            ),
          ),
          Text(
            "Flutter task 5",
            style: TextStyle(
                fontSize: 20
            ),
          ),
        ],
      ),
    );
  }
}