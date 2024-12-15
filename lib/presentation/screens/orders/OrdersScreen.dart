import 'package:flutter/material.dart';
import 'package:task_5/data/OrdersService.dart';
import 'package:task_5/presentation/models/OrderModel.dart';

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
    return SafeArea(
        child: Scaffold(
            body: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (BuildContext context, int index) => Row(
                  children: [
                    Text(orders[index].total.toString()),
                    SizedBox(width: 8.0),
                    Text(orders[index].createdAt.toString()),
                  ],
                )
            )
        )
    );
  }
}