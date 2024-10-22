import 'package:flutter/material.dart';

import '../../../res/sizes.dart';
import 'components/profile_additional_menu.dart';
import 'components/profile_menu.dart';
import 'components/profile_overview.dart';
import 'models/home_menu_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<ProfileMenuModel> items = [
    ProfileMenuModel(iconPath: "lib/assets/icons/order.png", label: "Мои заказы"),
    ProfileMenuModel(iconPath: "lib/assets/icons/cards.png", label: "Медицинские карты"),
    ProfileMenuModel(iconPath: "lib/assets/icons/address.png", label: "Мои адреса"),
    ProfileMenuModel(iconPath: "lib/assets/icons/settings.png", label: "Настройки"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileOverview(),
        const SizedBox(height: spacingLarge),

        ProfileMenu(
            items: items
        ),

        const SizedBox(height: spacingLarge),
        const Center(
          child: ProfileAdditionalMenu(),
        )
      ],
    );
  }
}
