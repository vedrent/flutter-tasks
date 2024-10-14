import 'package:flutter/material.dart';

class CartBottomBar extends StatelessWidget {
  double totalPrice;
  int totalCount;

  CartBottomBar({
    super.key,
    required this.totalPrice,
    required this.totalCount
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("$totalCount товар(-а/-ов)", style: const TextStyle(fontSize: 20)),
            const Spacer(),
            Text("Сумма: $totalPrice₽", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),

        SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              child: const Text("Купить", style: TextStyle(fontSize: 20)),

              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(300,50),
                  backgroundColor: const Color.fromRGBO(182, 247, 143, 1),
                  side: const BorderSide(color: const Color.fromRGBO(182, 247, 143, 1))
              ),
              onPressed: () {},
            )
        )
      ],
    );
  }
}