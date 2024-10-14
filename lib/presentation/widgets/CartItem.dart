import 'package:flutter/material.dart';
import '../models/CartItemModel.dart';
import '../screens/cart/CartItemCounter.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartItem extends StatelessWidget {
  final CartItemModel item;
  final VoidCallback onTap;
  final ValueChanged<int> onCountChanged;
  final VoidCallback deleteItem;

  const CartItem({
    super.key,
    required this.item,
    required this.onTap,
    required this.onCountChanged,
    required this.deleteItem
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Slidable(

          direction: Axis.horizontal,
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            extentRatio: 0.5,
            children: [
              SlidableAction(
                onPressed: (context) {
                  deleteItem();
                },
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Удалить',
              ),
            ],
          ),

          key: ValueKey(item.id.toString()),
          child: ListTile(
            leading: Image.network(
              alignment: Alignment.center,
              item.imageUri,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            title: Text(item.title, maxLines: 3, overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            subtitle: Text("${item.cost}₽",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            trailing: CartItemCounter(
              count: item.count,
              onIncreasePressed: () {
                onCountChanged(item.count + 1);
              },
              onDecreasePressed: () {
                if (item.count == 1) {
                  deleteItem();
                }
                else {
                  onCountChanged(item.count - 1);
                }
              },
            ),
            onTap: onTap,
          )
      ),
    );
  }
}