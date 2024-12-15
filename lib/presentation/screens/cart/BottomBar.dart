import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_5/data/OrdersService.dart';
import 'package:task_5/data/CartService.dart';
import 'package:task_5/presentation/models/OrderModel.dart';
import 'package:task_5/presentation/models/CartItemModel.dart';

class CartBottomBar extends StatelessWidget {
  double totalPrice;
  int totalCount;
  VoidCallback onCartClear;
  List<CartItemModel> itemsList;

  CartBottomBar({
    super.key,
    required this.totalPrice,
    required this.totalCount,
    required this.onCartClear,
    required this.itemsList
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
              onPressed: () {
                createOrder(
                    OrderModel(0, "", totalPrice, "Pending", ""), itemsList
                ).then((value) => {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Заказ оформлен')),
                  ),
                  clearCart().then((value) => onCartClear())
                });
              },
            )
        )
      ],
    );
  }
}