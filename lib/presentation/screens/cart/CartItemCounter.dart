import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartItemCounter extends StatelessWidget {
  final int count;
  final VoidCallback onIncreasePressed;
  final VoidCallback onDecreasePressed;

  const CartItemCounter({
    super.key,
    required this.count,
    required this.onIncreasePressed,
    required this.onDecreasePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            onPressed: () {
              onIncreasePressed();
            },
            icon: const Icon(Icons.plus_one)
        ),
        Container(
          height: 30,
          width: 30,
          color: Colors.white,
          child: Center(
              child: Text(count.toString(), style: const TextStyle(fontSize: 20))
          ),
        ),
        IconButton(
            onPressed: () {
              onDecreasePressed();
            },
            icon: const Icon(Icons.exposure_minus_1)
        ),
      ],
    );
  }
}