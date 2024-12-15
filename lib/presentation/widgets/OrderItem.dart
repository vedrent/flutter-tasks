import 'package:flutter/material.dart';
import 'package:task_5/presentation/models/OrderModel.dart';
class OrderItemWidget extends StatelessWidget {
  final OrderModel order;

  const OrderItemWidget({
    super.key,
    required this.order
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Номер заказа: ${order.id}",
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  const Text("Сумма заказа:",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                ]
            ),
            const Spacer(),
            Text("${order.total.toInt()} ₽",
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
          ],
        )
    );
  }
}