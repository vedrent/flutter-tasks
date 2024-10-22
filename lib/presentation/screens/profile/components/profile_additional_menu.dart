import 'package:flutter/material.dart';
import 'package:task_5/res/sizes.dart';

class ProfileAdditionalMenu extends StatelessWidget {
  const ProfileAdditionalMenu({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Column(
      children: [
        Text(
            "Ответы на вопросы",
            style: theme.textTheme.bodySmall
        ),
        const SizedBox(height: profileAdditionalMenuSpacing),

        Text(
            "Политика конфиденциальности",
            style: theme.textTheme.bodySmall
        ),
        const SizedBox(height: profileAdditionalMenuSpacing),

        Text(
            "Пользовательское соглашение",
            style: theme.textTheme.bodySmall
        ),
        const SizedBox(height: profileAdditionalMenuSpacing),

        Text(
            "Выход",
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.error
            )
        ),
      ],
    );
  }
}
