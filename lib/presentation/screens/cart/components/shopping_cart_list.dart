import 'package:flutter/material.dart';
import 'package:task_5/presentation/screens/cart/components/cart_item.dart';
import 'package:task_5/presentation/screens/cart/models/cart_item_model.dart';
import 'package:task_5/res/sizes.dart';

class ShoppingCartList extends StatelessWidget {
  ShoppingCartList({
    super.key,
    required this.items
  });

  List<CartItemModel> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              if (index > 0)
                const SizedBox(height: spacingSmall,),
              CartItem(
                model: items[index],
                onPlusPressed: () {},
                onMinusPressed: () {},
              )
            ],
          );
        }
    );
  }
}
