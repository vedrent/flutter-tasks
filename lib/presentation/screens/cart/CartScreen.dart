import 'package:flutter/material.dart';
import 'package:task_5/data/ProductsData.dart';
import 'package:task_5/presentation/models/CartItemModel.dart';
import 'package:task_5/presentation/screens/product/ProductDetailsScreen.dart';
import 'package:task_5/presentation/widgets/CartItem.dart';
import 'package:task_5/data/CartItemData.dart';
import 'BottomBar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItemModel> items = initialCartData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = items[index];
                  var product = initialProducts.firstWhere((element) => item.id == element.id);

                  return CartItem(
                    item: item,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(
                            product: product,
                            onDeleteClicked: () {
                              setState(() {
                                items.remove(item);
                                initialProducts.removeWhere((element) => element.id == item.id);
                              });
                            },
                            onInCartPressed: () {},
                            onLikeClicked: () {
                              setState(() {
                                var product = initialProducts.firstWhere((element) => element.id == item.id);
                                product.isFavorite = !product.isFavorite;
                              });
                            },
                          ),
                        ),
                      );
                    },
                    onCountChanged: (int value) {
                      setState(() {
                        item.count = value;
                      });
                    },
                    deleteItem: () {
                      setState(() {
                        items.remove(item);
                      });
                    },
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: CartBottomBar(
                totalPrice: sumPrices(),
                totalCount: getCartTotalCount(),
              ),
            ),
          ],
        )
    );
  }

  int getCartTotalCount() {
    int count = 0;

    for (int i = 0; i < items.length; i++) {
      count = count + items[i].count;
    }
    return count;
  }

  double sumPrices() {
    double sum = 0;

    for (int i = 0; i < items.length; i++) {
      sum += items[i].cost * items[i].count;
    }
    return sum;
  }
}