import 'package:flutter/material.dart';

class CartSummary extends StatelessWidget {
  CartSummary({
    super.key,
    required this.sum
  });

  int sum;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Сумма",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const Spacer(),
        Text(
          "$sum ₽",
          style: Theme.of(context).textTheme.headlineMedium,
        )
      ],
    );
  }
}
