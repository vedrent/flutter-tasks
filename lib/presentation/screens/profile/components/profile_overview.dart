import 'package:flutter/material.dart';

import '../../../../res/sizes.dart';

class ProfileOverview extends StatelessWidget {
  const ProfileOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: spacingLarge),
          Text(
            "Эдуард",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: spacingMedium),

          Text(
            "+7 900 800-55-33",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: const Color(0xFF898A8D)
            ),
          ),
          const SizedBox(height: spacingSmall),

          Text("email@gmail.com",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: const Color(0xFF898A8D)
            ),
          ),
        ]
    );
  }
}
