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
    return
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ButtonTheme(
              height: 10,
              minWidth: 10,
              child: IconButton(
                  onPressed: () {
                    onDecreasePressed();
                  },
                  icon: const Icon(Icons.remove)
              ),
            ),
            SizedBox(
              height: 20,
              width: 20,
              child: Center(
                  child: Text(count.toString(), style: const TextStyle(fontSize: 18))
              ),
            ),
            ButtonTheme(
              height: 10,
              minWidth: 10,
              child: IconButton(
                  onPressed: () {
                    onIncreasePressed();
                  },
                  icon: const Icon(Icons.add)
              ),
            ),
          ],
    );
  }
}