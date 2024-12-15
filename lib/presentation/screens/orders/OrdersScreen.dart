import 'package:flutter/material.dart';
import 'package:task_5/data/OrdersService.dart';
import 'package:task_5/presentation/models/OrderModel.dart';
import 'package:task_5/presentation/widgets/OrderItem.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<OrderModel> orders = [];

  @override
  void initState() {
    getOrders().then((value) => setState(() {
      orders = value;
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              Text("История заказов")
            ],
          ),
        ),
        body: ListView.builder(
            itemCount: orders.length,
            itemBuilder: (BuildContext context, int index) => Column(
              children: [
                OrderItemWidget(order: orders[index]),
                const Divider()
              ],
            )
        )
    );
  }
}