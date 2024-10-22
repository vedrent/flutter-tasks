import 'package:flutter/material.dart';
import 'package:task_5/presentation/screens/cart/components/cart_summary.dart';
import 'package:task_5/presentation/screens/cart/components/shopping_cart_list.dart';
import 'package:task_5/presentation/screens/cart/models/cart_item_model.dart';
import 'package:task_5/presentation/widgets/my_text_button.dart';

import '../../../res/sizes.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  List<CartItemModel> cartItems = [
    CartItemModel(
        "Клинический анализ крови с лейкоцитарной формулировкой",
        690,
        1
    ),
    CartItemModel(
        "ПЦР-тест на определение РНК коронавируса стандартный",
        1800,
        1
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: spacingLarge),
        Text(
          "Корзина",
          style: Theme.of(context).textTheme.headlineLarge,
        ),

        const SizedBox(height: 38,),
        ShoppingCartList(items: cartItems),

        const SizedBox(height: 40,),
        CartSummary(sum: sumCartItemsPrice()),
        
        const Spacer(),
        MyTextButton(
          text: "Перейти к оформлению заказа",
          onPressed: () {},
          textStyle: Theme.of(context).textTheme.bodyLarge,
          width: double.infinity,
          height: 56,
        ),
        const SizedBox(height: 30,),
      ],
    );
  }

  int sumCartItemsPrice() {
    int sum = 0;
    for (var i in cartItems) {
      sum += i.price;
    }
    return sum;
  }
}
