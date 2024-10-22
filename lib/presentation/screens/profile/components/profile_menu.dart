import 'package:flutter/material.dart';

import '../models/home_menu_model.dart';
import 'profile_menu_item.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.items
  });

  final List<ProfileMenuModel> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeMenuItem(
          model: items[0],
        ),
        HomeMenuItem(
          model: items[1],
        ),
        HomeMenuItem(
          model: items[2],
        ),
        HomeMenuItem(
          model: items[3],
        )
      ]
    );
  }
}
